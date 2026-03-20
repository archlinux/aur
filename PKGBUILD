# Maintainer: tobast <contact at tobast dot fr>

pkgname=choria-cm
pkgver=0.0.20
pkgrel=1
pkgdesc="Choria Configuration Management"
arch=('any')
url="https://github.com/choria-io/ccm"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('1e5fc7ecb591e40c1c2d79a25d32d91a2f3a70bac1cd46a8ac69fcad74ed141c')

_archive_name='ccm'

prepare() {
    sed -i "s/Version = \"development\"/Version = \"${pkgver}\"/" \
        ccm-${pkgver}/cmd/ccm.go
}

build() {
    cd "$srcdir/${_archive_name}-${pkgver}"
	go build -o ccm ./cmd
}

package() {
    cd "$srcdir/${_archive_name}-${pkgver}"

    install -D -m644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "./ccm" "$pkgdir/usr/bin/ccm"
}
