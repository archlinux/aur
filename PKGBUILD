# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname=dybuk-git
_pkgname=dybuk
pkgver=r37.ef12906
pkgrel=1
pkgdesc='Prettify the ugly Rustc messages'
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/Ticki/dybuk'
license=(
    'MIT'
)
depends=(
    'gcc-libs'
)
makedepends=(
    'cargo'
    'git'
    'rust'
)
provides=(
    'dybuk'
)
conflicts=(
    'dybuk'
)
source=(
    'git+https://github.com/Ticki/dybuk.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}" | exit 1
	printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"	\
        "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}" | exit 1
	cargo build --release
}

package() {
	cd "${srcdir}/${_pkgname}" | exit 1
    install -m755 \
        -D "target/release/dybuk" "${pkgdir}/usr/bin/${_pkgname}"
    install	-m644 \
        -D "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
