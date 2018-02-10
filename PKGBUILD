# Maintainer: ILMostro7 <ilmostro7@gmail.com>

pkgname=appc
pkgver=0.8.11
pkgrel=1
pkgdesc="App container tools (DEPRECATED; use OCI opencontainers.org)"
arch=('x86_64')
url="https://github.com/appc/spec"
license=(apache)
depends=('glibc')
makedepends=('go')
provides=('appc')
source=("https://github.com/appc/spec/archive/v${pkgver}.tar.gz")
sha1sums=('8dd9af6648cf367919774eb0613b0697471a8858')

build() {
  cd "spec-${pkgver}"
  ./build.sh
  strip bin/*
}

package() {
  cd "spec-${pkgver}"
  install -Dm755 bin/ace-validator "$pkgdir/usr/bin/ace-validator"
  install -Dm755 bin/actool "$pkgdir/usr/bin/actool"
  install --directory "$pkgdir/usr/share/doc/${pkgname}/examples"
  install *.md "$pkgdir/usr/share/doc/${pkgname}"
  install examples/* "$pkgdir/usr/share/doc/${pkgname}/examples"
}

# vim:set ts=2 sw=2 et:
