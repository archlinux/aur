# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=jaero-git
pkgver=r396.1d4e515
pkgrel=1
pkgdesc="Demodulate and decode Aero signals"
arch=(x86_64)
url="https://jontio.zapto.org/hda1/jaero.html"
license=('MIT')
groups=()
depends=(libacars libcorrect qt5-base libogg qt5-multimedia qt5-svg qmqtt qcustomplot zeromq libvorbis)
optdepends=('libaeroambe: audio support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('jaero::git+https://github.com/jontio/JAERO.git' 'JFFT::git+https://github.com/jontio/JFFT.git')
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd JAERO
	qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cd JAERO
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	cd JAERO
	make INSTALL_ROOT="$pkgdir/" DESTDIR="$pkgdir/" install
}
