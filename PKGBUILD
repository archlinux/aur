# Contributor: Diego <cdprincipe@at@gmail@dot@com>
#Maintainer: Pablo Lezaeta <prflr88@gmail.com>

_themename=Bluebird
pkgname=xfce-theme-bluebird-git
pkgver=1.2.r154
pkgrel=1
pkgdesc="A light blue Xfce theme, introduced in the release of Xubuntu 10.10"
arch=('any')
url="https://github.com/shimmerproject/Bluebird"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('xfce-theme-bluebird')
conflicts=('xfce-theme-bluebird')
source=("${_themename}::git+http://github.com/shimmerproject/Bluebird")
md5sums=('SKIP')

pkgver() {
  cd "${_themename}"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {
  cd "$srcdir/${_themename}"

  # create theme dirs
  install -d -m 755 "${pkgdir}/usr/share/themes/${_themename}"

  # clean up
  rm -rf {.git,.gitignore,CREDITS,LICENSE,README}

  # install theme
  cp -r . "$pkgdir/usr/share/themes/${_themename}/"
}
