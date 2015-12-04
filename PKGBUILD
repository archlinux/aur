# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com

pkgname=git-gitlab
pkgver=r72.c17290b182b5a5df866a57dfacee93f6b2055d8c
pkgrel=1
pkgdesc="gitlab command line interface"
arch=('x86_64' 'i686')
url="http://github.com/numa08/git-gitlab"
license=('MIT')
makedepends=('go' 'libgit2')
depends=('libgit2')
options=('!strip' '!emptydirs')
source=("https://github.com/voidus/$pkgname/archive/${pkgver#r*.}.zip")
sha256sums=('c7fe90812868cd1b2a0eeaa708a0a5fbba92a9d7bada76092a2b360aa46ab7f5')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/codegangsta/cli
  go get github.com/plouc/go-gitlab-client
  go get gopkg.in/libgit2/git2go.v23
}

build() {
  cd "$pkgname-${pkgver#r*.}"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname-${pkgver#r*.}"

  install -Dm755 "$pkgname-${pkgver#r*.}" "$pkgdir/usr/bin/git-lab"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
