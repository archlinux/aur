# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_gitname=laravel-ls
pkgname="${_gitname}-git"
pkgver=r234.a93641a
pkgrel=1
pkgdesc='Laravel Language Server written in go.'
arch=(x86_64)
url="https://github.com/${_gitname}/${_gitname}"
license=("GPL-3.0")
makedepends=(go git make)
source=(
  "git+https://github.com/${_gitname}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_gitname
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make
}

package() {
  install -vDm755 $_gitname/build/laravel-ls -t "$pkgdir/usr/bin"
}
