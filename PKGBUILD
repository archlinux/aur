# Submitter: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
pkgname="onboard-sdk"
pkgdesc="DJI Onboard SDK"
url="https://github.com/dji-sdk/Onboard-SDK"
pkgver=4.1.0
arch=('x86_64')
pkgrel=1

source=("https://github.com/dji-sdk/Onboard-SDK/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/dji-sdk/Onboard-SDK/pull/740.patch")

depends=('cmake')
sha256sums=('9a7c7678837f55d2380bf4e97bdf9bf0554acc36d2878f35fba36969360c16c6'
            'SKIP')

_pkgdir="Onboard-SDK"

prepare() {
    cd "${_pkgdir}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/740.patch"
}

build() {
	cmake -B build -S "${_pkgdir}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	make -C build
}

package() {
	cd build
	make DESTDIR="${pkgdir}/" install
}
