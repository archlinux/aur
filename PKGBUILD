# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server')
pkgbase=tailwindcss-intellisense
pkgver=0.6.8
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
b2sums=('376c47a6ff4d1fa4e228146cddc8e3cb17fc180ba8f47463dd5c9988772a4d65424506d4100341ef6c8b9bace7da05fe6f24b35ed67c3494324855f09acc23f4')

build() {
  cd $pkgbase-$pkgver
  npm ci
  npm run bootstrap
  cd packages/${pkgname[0]}
  npm run build
}

package_tailwindcss-language-server() {
  pkgdesc='Tailwind CSS Language Server'
  conflicts=("$pkgbase")
  cd $pkgbase-$pkgver/packages/${pkgname[0]}
  install -Dt "$pkgdir"/usr/bin bin/${pkgname[0]}
}

#package_vscode-tailwindcss() {
#}

# vim:set ts=2 sw=2 et:
