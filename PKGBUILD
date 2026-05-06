# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=nightlight-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Experience a new way of connecting with like-minded people on Nightlight, a free social media platform that values inclusivity, customization, and an ad-free environment."

arch=('x86_64')

url="https://nightlightapp.net/"
license=('Proprietary')

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
sha256sums=('0158567575707918d98ea172fbc1624528c99a5624c51f91653efe4173f78719')

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
