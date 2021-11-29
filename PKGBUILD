# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.7.2
_serverver=0.0.4
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('68a25a0aa0d056f12d5eebf65fa4bdce101cd6ea8694c93c251a5a2bd812d2eaf3fa63521b1315fe4e6cce5e7556e2222bacbdad3da1ddc4079f25c23e757cee')

build() {
  cd $pkgbase-$pkgver
  npm ci
  npm run bootstrap
  cd packages/"${pkgname[0]}"
  npm run build
}

package_tailwindcss-language-server() {
  provides=("tailwindcss-language-server=$_serverver")
  pkgdesc='Tailwind CSS Language Server'
  conflicts=("$pkgbase")
  cd $pkgbase-$pkgver/packages/"${pkgname[0]}"
  install -Dt "$pkgdir"/usr/bin bin/"${pkgname[0]}"
}

#package_vscode-tailwindcss() {
#}

# vim:set ts=2 sw=2 et:
