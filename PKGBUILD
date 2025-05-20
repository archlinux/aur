# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
_pkgname=helix-gpt
pkgname=$_pkgname-git
pkgver=0.34+7+g494daf6
pkgrel=2
pkgdesc="Code assistant language server for Helix with support among many LLMs"
arch=('x86_64')
url="https://github.com/leona/$_pkgname"
license=("MIT")
depends=()
makedepends=('git' 'bun')
optdepends=('helix: editor that can use helix-gpt as a language server')
options=("!debug" "!strip")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed -r 's/^[r|v]//;s/-/+/g' ||
    printf '%s+%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
  )
}

build() {
  cd ${_pkgname}
  bun install
  bun run build:bin
}

package() {
  cd ${_pkgname}
  install -Dm755 dist/helix-gpt "$pkgdir/usr/bin/helix-gpt"
}
