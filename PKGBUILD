# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-intellisense
pkgver=0.5.10
pkgrel=2
pkgdesc='Intelligent Tailwind CSS tooling (language server)'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('723078cee751740a4cd43ce92931fe22c7d65bd8593223c393e2f748a4e27a28fe3552de309f0b943656d62f18bc5622d3b07608ce22751467fccda03933f41b')

build() {
  cd $pkgname-$pkgver
  npm ci
  npm run build --workspace=tailwindcss-language-service \
    --workspace=vscode-tailwindcss
  npm run minify --workspace=vscode-tailwindcss
}

package() {
  cd $pkgname-$pkgver/packages/$pkgname/dist/server
  install -d "$pkgdir"/usr/bin
  cat <(echo '#!/usr/bin/env node') index.js > "$pkgdir"/usr/bin/$pkgname
  chmod +x "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
