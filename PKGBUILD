# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-intellisense
pkgver=0.6.3
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling (language server)'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('1648c19e787726488f2266e9cc202d0f73c2e052ee40ac9f27a7218299336545d73d2c5244efab08f36b03a0dd1f4e07d8c9bd5b412aef8c3ebd2d5dd87cf4e6')

build() {
  cd $pkgname-$pkgver
  npm ci
  npm run build
  npm run minify
}

package() {
  cd $pkgname-$pkgver/dist/server
  install -d "$pkgdir"/usr/bin
  cat <(echo '#!/usr/bin/env node') index.js > "$pkgdir"/usr/bin/$pkgname
  chmod +x "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
