# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: maz-1 < ohmygod19993@gmail.com >

pkgname=unshield-git
pkgver=1.4.2.r12.g148d510
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers"
arch=('i686' 'x86_64')
url="https://github.com/twogood/unshield"
license=('MIT')
depends=('zlib' 'openssl')
makedepends=('cmake' 'git')
provides=('unshield')
conflicts=('unshield')
source=("git+https://github.com/twogood/unshield")
md5sums=('SKIP')

pkgver() {
	cd unshield
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build

  cmake ../unshield -DCMAKE_INSTALL_PREFIX=/usr \
                    -DCMAKE_INSTALL_LIBDIR=lib \
                    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  # license
  install -Dm644 unshield/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
