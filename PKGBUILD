# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

pkgname=sops
pkgver=3.6.1
pkgrel=1
pkgdesc='Editor of encrypted files that supports YAML, JSON and BINARY formats'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/mozilla/sops'
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bb6611eb70580ff74a258aa8b9713fdcb9a28de5a20ee716fe6b516608a60237')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o "$pkgname" ./cmd/sops/
}

check() {
  cd "${pkgname}-${pkgver}"
  go test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 sops "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
