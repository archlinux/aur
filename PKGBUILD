# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-intellisense
pkgver=0.6.6
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling (language server)'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d6d427b5101a6b159997092083e7c1e294a099d4679c34e313f01f77e94110e1b02309754acdde7a655c0a2a10f543e8a29bfe48eb741e85aea19c08b5697d04')

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
