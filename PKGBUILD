# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-intellisense
pkgver=0.6.4
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling (language server)'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4b053f39bb715529c0ceb2a89e1735651c54c49ea71b6c8f7f7717f36c26b7513e2b4168ef90f06e7b43586f6ca5bce5863dab3b871bdfe24fcb57869d081282')

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
