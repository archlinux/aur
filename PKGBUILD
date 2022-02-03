# Maintainer: Andrew Sichevoi, http://thekondor.net

_pkgname=i3-extra-workspace
_gitname=i3-extra-workspace
pkgname=$_pkgname-git
pkgver=r5.feb0e25
pkgrel=1
pkgdesc="Workspace-specific scratchpads (extra workspaces) for i3"

arch=('any')
url="https://github.com/thekondor/i3-extra-workspace"
license=('Apache 2.0')
depends=('i3-wm')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/thekondor/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  go test -v ./... && go build
}

package() {
  cd "$_gitname"

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/dist/hotkeys.conf.example" "$pkgdir/usr/share/$pkgname/hotkeys.conf.example"
  install -Dm755 "$srcdir/$_gitname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
