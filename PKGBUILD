# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.7.0
_serverver=0.0.4
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('a2c5a63e6a7acc49ed282a57340314221b681a2d55af2686cec39e7b43ae0fe8411ec6a5fae05916a7287460cc3bd642ef0acf0fd06976166354dfa82e1d8f41')

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
