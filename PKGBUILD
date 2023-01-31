# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-language-server
pkgver=0.0.11
pkgrel=1
pkgdesc='Tailwind CSS Language Server'
arch=('any')
url=https://github.com/tailwindlabs/tailwindcss-intellisense/tree/master/packages/tailwindcss-language-server
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+https://github.com/tailwindlabs/tailwindcss-intellisense.git#tag=@tailwindcss/language-server@v$pkgver")
b2sums=('SKIP')

prepare() {
  cd tailwindcss-intellisense
  npm ci
}

build() {
  cd tailwindcss-intellisense
  npm run bootstrap
  cd packages/$pkgname
  npm run build
}

package() {
  cd tailwindcss-intellisense/packages/$pkgname
  install -Dt "$pkgdir"/usr/bin bin/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
