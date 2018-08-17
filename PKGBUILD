# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=git-bug-git
pkgver=0.2.0+1+gc974cc0
pkgrel=1
pkgdesc='Distributed bug tracker embedded in Git (git)'
arch=(i686 x86_64)
url=https://github.com/MichaelMure/git-bug
license=(GPL3)
makedepends=(go)
provides=(git-bug)
conflicts=(git-bug git-bug-bin)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd git-bug
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd git-bug
  GOPATH="$srcdir"/git-bug go get -v -x github.com/MichaelMure/git-bug
}

package() {
  cd git-bug
  install -D bin/git-bug "$pkgdir"/usr/bin/git-bug
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/git-bug
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/git-bug
}
