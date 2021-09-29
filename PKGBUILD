# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.6.15
_serverver=0.0.4
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('e8c0b4e93d287d31ec96c3accc0c651df66fd0dd9cbb689258b43d2a424048555d788c3f51cbcdcdd29d60183ed3ef4219759df94e49e3f5632b0f45d52d3067')

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
