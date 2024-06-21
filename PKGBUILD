# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=keyring-cli
_pkgname=keyring
pkgdesc="A very basic cli keyring tool to use accross various OS."
pkgver=1.0.2
pkgrel=2
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
    "6ff9af7f95b3d583e1bb247b9b1fed25b7e68548301764dce6fc4e9a16418ef7"
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
    install -D -m0755 "${srcdir}/$_pkgname-$pkgver/keyring" "${pkgdir}/usr/bin/kc"
}
