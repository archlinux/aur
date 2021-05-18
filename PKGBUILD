# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-intellisense
pkgver=0.6.5
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling (language server)'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('96d220876cd4ef7a7484447e3e7975e8b2bd3220872b2b734eafe3aba102b73c7bbffbf362b38613c0b8118841838fb3cba61c8f464590afd85019aafc0f5630')

build() {
  cd $pkgname-$pkgver
  npm ci
  npm run build
}

package() {
  cd $pkgname-$pkgver/dist/server
  install -d "$pkgdir"/usr/bin
  cat <(echo '#!/usr/bin/env node') tailwindServer.js > "$pkgdir"/usr/bin/$pkgname
  chmod +x "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
