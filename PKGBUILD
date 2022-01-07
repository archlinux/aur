# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.7.3
_serverver=0.0.5
pkgrel=2
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('6e171ada64a5b383f4f0e4e7a24576e3f0906d6741248f1747397e65a71ec28ac1b0ccc26071135abe4839bd67088ce2042c03477318801604c4eded5d04a70e')

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
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"${pkgname[0]}" LICENSE
}

#package_vscode-tailwindcss() {
#}

# vim:set ts=2 sw=2 et:
