# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=tailwindcss-language-server
_commit=f49c7e84a1ef74c214a824f136dde3a63c3e8076
pkgver=0.0.9
pkgrel=1
pkgdesc='Tailwind CSS Language Server'
arch=('any')
url=https://github.com/tailwindlabs/tailwindcss-intellisense/tree/master/packages/tailwindcss-language-server
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+https://github.com/tailwindlabs/tailwindcss-intellisense.git#commit=$_commit")
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
