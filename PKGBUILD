# Contributor: Andres Erbsen <andres@krutt.org>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>

pkgbase=pond-git
pkgname=(pond-git pond-server-git)
_gitname=pond
pkgrel=1
pkgver=439.f422bc3
pkgdesc="Forward-Secure asynchronous messaging"
url="https://pond.imperialviolet.org/"
arch=('x86_64' 'i686')
license=('BSD') # 3-clause
depends=('hunspell-en' 'tor' 'gtkspell3')
optdepends=('trousers: TPM support')
makedepends=('go' 'git' 'mercurial' 'gtkspell3' 'trousers')
options=('!strip' '!emptydirs')
_gourl="github.com/agl/$_gitname"
source=("git+https://${_gourl}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/client/...
  GOPATH="$srcdir" go get -v -x ${_gourl}/server/...
}

package_pond-git() {
  install -Dm755 "$srcdir/bin/client" "$pkgdir/usr/bin/pond"
}

package_pond-server-git() {
  install -Dm755 "$srcdir/bin/server" "$pkgdir/usr/bin/pond-server"
}

# vim:set ts=2 sw=2 et:
