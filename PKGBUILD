# Maintainer: gryffyn <aur at evan dot mp>

pkgname=netctl-obfuscate
pkgver=v0.1.0
pkgrel=1
pkgdesc="A tool wrapping wpa_passphrase to convert plaintext keys in netctl config files to a PSK."
arch=('any')
url="https://github.com/gryffyn/netctl-obfuscate"
license=("MIT")
makedepends=('go' 'git')
source=("${pkgname}"::"git+https://github.com/gryffyn/${pkgname}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  mkdir build
  go build -o build/${pkgname}
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
