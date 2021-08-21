# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.6.14
_serverver=0.0.3
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('2329dc94d90a7d06bf6ce81c9ce943694eb731880595fe8286f5244ab54fbdf5807135887bf857f99ed4790e95509808b30d10621ced7f4cbe337edeaeff50f7')

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
