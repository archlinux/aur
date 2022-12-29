# Maintainer: justforlxz <justforlxz@gmail.com>

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-icon-theme-git
pkgver=2021.11.24.r15.g88a5c7ab
pkgrel=1
pkgdesc="Deepin GTK Theme"
arch=('any')
url="https://github.com/linuxdeepin/deepin-gtk-theme"
makedepends=('git')
license=('LGPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes')
groups=('deepin-git')
conflicts=(deepin-icon-theme)
provides=(deepin-icon-theme)
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-icon-theme/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    if [[ ! -z ${sha} ]];then
      git checkout -b $sha
    fi
}

build() {
  cd $pkgname
  make hicolor-links
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  cp -a ./Sea ./usr/share/icons/hicolor "$pkgdir"/usr/share/icons/
}
