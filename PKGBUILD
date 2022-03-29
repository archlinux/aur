# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=keyring-cli
_pkgname=keyring
pkgdesc="A very basic cli keyring tool to use accross various OS."
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/keyring"
license=('MPL2')
makedepends=(
    'go'
)

source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/vbouchaud/keyring/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    "9578cd0566f0b5e75c9ed274931df3063ff4a5903a3d5e898eacdb82fc23a249"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$_pkgname-$pkgver"
    make VERSION=v$pkgver keyring
}

package() {
    install -D -m0755 "${srcdir}/$_pkgname-$pkgver/keyring" "${pkgdir}/usr/bin/keyring"
}
