# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com

pkgname=git-gitlab
pkgver=f5392cabaf5e9d97b2e33390ab77f05367924379
pkgrel=1
pkgdesc="gitlab command line interface"
arch=('x86_64' 'i686')
url="http://github.com/numa08/git-gitlab"
license=('MIT')
makedepends=('go', 'libgit2')
depends=('libgit2')
options=('!strip' '!emptydirs')
source=("https://github.com/numa08/$pkgname/archive/$pkgver.zip")
sha256sums=('eaa2b26f4e1c332631beff2413a5a9cae33fc6c9383f7ca66a232ba975a53abf')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/codegangsta/cli
  go get github.com/plouc/go-gitlab-client
  go get gopkg.in/libgit2/git2go.v22
}

build() {
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/git-lab"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
