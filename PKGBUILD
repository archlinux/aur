# Maintainer: Le Soup le.soup@hotmail.com

pkgname=modo
pkgver=$(git -c 'versionsort.suffix=-' ls-remote -t --exit-code --refs --sort=-v:refname \
    https://github.com/mlange-42/modo 'v*' \
    | sed -En '1!q;s/^[[:xdigit:]]+[[:space:]]+refs\/tags\/v(.+)/\1/p')
pkgrel=1
pkgdesc="Documentation generator (DocGen) for the Mojo programming language"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64') # Supported architectures
url="https://github.com/mlange-42/modo"
license=('MIT')
depends=('glibc')  # Depends on Modular 'magic' cli for managing mojo environments, which isnt on AUR yet. Most users of modo already have magic.
makedepends=('go' 'git') 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mlange-42/modo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') #Dynamic pkg

build() {
    export GOPATH="${srcdir}/go"
    mkdir -p "$GOPATH"
    cd "$srcdir"
    go install github.com/mlange-42/modo@v${pkgver}
}

package() {
    install -Dm755 "${srcdir}/go/bin/modo" "${pkgdir}/usr/bin/modo"
}


provides=("${pkgname}")
conflicts=("${pkgname}")
