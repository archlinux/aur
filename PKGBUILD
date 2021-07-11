# Maintainer: Abdul Khaliq <a.khaliq@outlook.my>

pkgname=subvars
pkgver=0.1.3
pkgrel=1
pkgdesc='Substitute environment variables from command line for template driven configuration files.'
arch=('x86_64')
url='https://subvars.lmno.pk'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kha7iq/subvars/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96e182efa8287d0e9ad9b7cab121c52e712bfa578bd76a7a1937e4476db71234')

build() {
    export GOFLAGS="-trimpath"
    cd $pkgname-$pkgver/
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .    
}

package() {
    cd $pkgname-$pkgver/
    install -Dm755 -t $pkgdir/usr/bin/ subvars
    install -Dm644 -t $pkgdir/usr/share/doc/subvars/ README.md
}
