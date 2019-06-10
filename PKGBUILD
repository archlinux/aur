# Maintainer: Patrice Lacouture <archlinux@lacouture.org>
pkgname=libsqrl-git
pkgver=20180430.135f6ba
pkgrel=1
pkgdesc="A SQRL Authentication library"
arch=('x86_64')
url="https://github.com/Novators/libsqrl"
license=('MIT')
depends=('uriparser' 'libsodium')
makedepends=('git' 'cmake')
conflicts=('libsqrl')
provides=('libsqrl')
source=('git+https://github.com/Novators/libsqrl.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
        mkdir -p build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
        cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" ..
        make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
        make install
        mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
        install -m 755 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}