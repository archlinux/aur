# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname="i3lock-color"
pkgver=2.7.e003249
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with color configuration support"
arch=('i686' 'x86_64')
url="https://github.com/kageurufu/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'libx11' 'cairo')
provides=('i3lock')
conflicts=('i3lock')
makedepends=('git')
source=("git+https://github.com/kageurufu/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git describe --tags --abbrev=0).$(git rev-parse --short HEAD)"
}

build() {
cd "${srcdir}/${pkgname}"
make
}

package() {
cd "${srcdir}/${pkgname}"
make DESTDIR="$pkgdir" install
install -Dm644 i3lock.1 ${pkgdir}/usr/share/man/man1/i3lock.1
install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
