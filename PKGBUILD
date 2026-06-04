# Maintainer: Firestar <zhang_zhijun@pku.edu.cn>

pkgname=sofia2
pkgver=2.7.0
pkgrel=1
pkgdesc="Source Finding Application (SoFiA 2) for automated source finding in spectral-line data cubes"
arch=('x86_64')
url="https://gitlab.com/SoFiA-Admin/SoFiA-2"
license=('GPL-3.0-or-later')

depends=(
'wcslib'
'libgomp'
'glibc'
)

makedepends=(
'gcc'
'make'
)

source=(
"${pkgname}-${pkgver}.tar.gz::https://gitlab.com/SoFiA-Admin/SoFiA-2/-/archive/v${pkgver}/SoFiA-2-v${pkgver}.tar.gz"
)

sha256sums=(
'373fdbb9235490a6ad2e4906c5c10cec7da1f34f503de6dfc26466fcf28e2e7b'
)

prepare() {
cd "${srcdir}/SoFiA-2-v${pkgver}"

# Preserve Arch build flags instead of overwriting them
sed -i \
    -e 's/^CFLAGS = /CFLAGS := $(CFLAGS) /' \
    -e 's/^LDFLAGS = /LDFLAGS := $(LDFLAGS) /' \
    Makefile

}

build() {
cd "${srcdir}/SoFiA-2-v${pkgver}"

make OMP=true

}

package() {
cd "${srcdir}/SoFiA-2-v${pkgver}"

install -Dm755 sofia \
    "${pkgdir}/usr/bin/sofia"

install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
