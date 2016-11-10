# Maintainer: Hugo Denizart <thepoon@cartooncraft.fr>

pkgname=obs-qtwebkit-git
pkgver=3dd7cde
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on QtWebkit library."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-qtwebkit"
license=("GPL2")
depends=("obs-studio" "qt5-base" "qt5-webkit")
makedepends=("make" "git")
provides=("obs-qtwebkit")
source=("$pkgname::git+https://github.com/bazukas/obs-qtwebkit#branch=master"
        "000_install_path.patch")
md5sums=("SKIP"
         "27e8210140dd54c4529a78bef43347ab")

pkgver() {
  cd $pkgname
  git rev-parse --short HEAD
}

prepare() {
  cd $pkgname
  patch -u < ../000_install_path.patch
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX=$pkgdir make install
}
