# Contributor: Diego <cdprincipe atgmaildot com>
# Maintainer: Pablo Lezaeta <prflr88@gmai.com>

pkgname=xfce-theme-albatross-git
pkgver=1.7.3.r108
pkgrel=1
pkgdesc="A dark, smooth Xfce theme, introduced in the release of Xubuntu 9.10"
arch=('any')
url="https://github.com/shimmerproject/Albatross"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('xfce-theme-albatross')
conflicts=('xfce-theme-albatross')
source=('Albatross::git+http://github.com/shimmerproject/Albatross')
md5sums=('SKIP')

pkgver() {
  cd "Albatross"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {
  cd "${srcdir}/Albatross"

  # create theme dirs
  install -d -m 755 "${pkgdir}"/usr/share/themes/Albatross{,-compact/xfwm4}

  # clean up
  rm -rf {.git,.gitignore,LICENSE.{CC,GPL},README}

  # install theme
  cp -r . "${pkgdir}/usr/share/themes/Albatross/"
}
