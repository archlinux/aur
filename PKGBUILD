# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Agorgianitis Loukas <agorglouk@gmail.com>

pkgname=('tailwindcss-language-server-git')
pkgbase=tailwindcss-intellisense-git
pkgver=0.6.14.r0.gd435db1
pkgrel=1
pkgdesc='Intelligent Tailwind CSS tooling'
url=https://github.com/tailwindlabs/tailwindcss-intellisense
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgbase%-git}
  npm ci
  npm run bootstrap
  cd packages/"${pkgname[0]%-git}"
  npm run build
}

package_tailwindcss-language-server-git() {
  pkgdesc='Tailwind CSS Language Server'
  provides=("${pkgname[0]%-git}")
  conflicts=("${pkgname[0]%-git}")
  cd ${pkgbase%-git}/packages/"${pkgname[0]%-git}"
  install -Dt "$pkgdir"/usr/bin bin/"${pkgname[0]%-git}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"${pkgname[0]}" LICENSE
}

#package_vscode-tailwindcss-git() {
#}

# vim:set ts=2 sw=2 et:
