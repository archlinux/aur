# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
_commit=bb5993d047dbb07ceedf89ff790bf418aa9f23db
pkgver=0.7.6.r5.gbb5993d
_serverver=0.0.7
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgbase
  npm ci
  npm run bootstrap
  cd packages/"${pkgname[0]}"
  npm run build
}

package_tailwindcss-language-server() {
  pkgdesc='Tailwind CSS Language Server'
  provides=("tailwindcss-language-server=$_serverver")
  conflicts=("$pkgbase")
  cd $pkgbase/packages/"${pkgname[0]}"
  install -Dt "$pkgdir"/usr/bin bin/"${pkgname[0]}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"${pkgname[0]}" LICENSE
}

#package_vscode-tailwindcss() {
#}

# vim:set ts=2 sw=2 et:
