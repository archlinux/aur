# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com

pkgname=git-gitlab
pkgver=r80.f951d0528838aad99f768d504b36b03194daa72e
pkgrel=2
pkgdesc="gitlab command line interface"
arch=('x86_64' 'i686')
url="http://github.com/numa08/git-gitlab"
license=('MIT')
makedepends=('go' 'libgit2')
depends=('libgit2')
options=('!strip' '!emptydirs')
source=("https://github.com/voidus/$pkgname/archive/${pkgver#r*.}.zip")
sha256sums=('0e779cab0456f73b071844f18c2eecf6c8cc0b0b8ca2d0811c96ef3b0ac36048')

prepare() {
  export GOPATH="$srcdir"
  go get gopkg.in/libgit2/git2go.v24
  go get github.com/plouc/go-gitlab-client
  go get github.com/codegangsta/cli
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
