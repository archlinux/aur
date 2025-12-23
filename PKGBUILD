# Maintainer: Sergio Mancha <smancha@proton.me>
pkgname=toml-f
pkgver=0.4.3
pkgrel=11
pkgdesc="TOML Parser Implementation For Data Serialization and Deserialization in Fortran"

arch=("x86_64")
url="https://toml-f.readthedocs.io/en/latest/"
license=("MIT" "Apache-2.0")

depends=()
makedepends=("meson>=0.55" "ninja>=1.7" "gcc-fortran>=5.0")

source=("https://github.com/toml-f/toml-f/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d7fdd12a68c2e433785f453b20c1984bed037d213a35d8f0946da7e7f6b89c45")

build () {
	cd "$srcdir"/"${pkgname}-${pkgver}"
	meson setup _build --prefix=/usr
	meson compile -C _build
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    meson test -C _build --print-errorlogs
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	meson install -C _build --destdir="${pkgdir}"
    
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Apache"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
