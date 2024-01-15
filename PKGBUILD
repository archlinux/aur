# Maintainer: Narthana Epa <narthana.epa@gmail.com>

_pkgname=gow
pkgname=gow-git
pkgver=r69.af11a6e
pkgrel=1
pkgdesc='Missing watch mode for Go commands'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/mitranim/gow'
license=('UNLICENSE')
source=("git+https://github.com/mitranim/gow.git")
makedepends=('go' 'git')
provides=('gow')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname" || return 1
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly .
}

package() {
  cd "$_pkgname" || return 1
  install -D "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim: ts=2 sw=2 et:
