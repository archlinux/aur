# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=nightlight-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Experience a new way of connecting with like-minded people on Nightlight, a free social media platform that values inclusivity, customization, and an ad-free environment."

provides=(nightlight)
conflicts=(nightlight)

arch=('x86_64')

url="https://nightlightapp.net/"

# Electron's dependencies, as Nightlight ships with a vendored
depends=(
	c-ares
	gcc-libs # libgcc_s.so
	glibc # libc.so libm.so
	gtk3 libgtk-3.so
	libevent
	libffi libffi.so
	nss # libnss3.so
	zlib libz.so
)

source=("$pkgname-$pkgver.deb::https://assets.night-light.cz/nightlight_${pkgver}_amd64.deb")
sha256sums=('9121387bc2709c88c8a1fc3b09d9ef1b60426e0b5ca251c21700c2c8316bca06')

noextract=("$pkgname-$pkgver.deb")

prepare() {
	if [[ -d tmp ]]; then
		rm -rf tmp
	fi

	mkdir tmp
	mkdir -p "$pkgname-$pkgver"
	ar x --output tmp "./$pkgname-$pkgver.deb"

	tar -xf tmp/data.tar.xz -C "$srcdir/$pkgname-$pkgver/"
}

package() {
	cd "$pkgname-$pkgver/"

	cp -r ./* "$pkgdir"
}
