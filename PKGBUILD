# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=keyring-cli-git
_pkgname=keyring
pkgdesc="A very basic cli keyring tool to use accross various OS."
pkgver=1.0.1.r1.g20fba88
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/keyring"
license=('MPL2')
conflicts=('keyring-cli')
provides=('keyring-cli')
makedepends=(
    'go'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://github.com/vbouchaud/keyring#branch=main"
)

sha256sums=(
    "SKIP"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  make keyring
}

package() {
  install -D -m0755 "$srcdir/$_pkgname/keyring" "$pkgdir/usr/bin/keyring"
}
