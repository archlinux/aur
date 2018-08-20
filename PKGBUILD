# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=git-bug-git
pkgver=0.2.0+15+g8abf984
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
  install -Dm 644 -t "$pkgdir"/usr/share/bash-completion/completions misc/bash_completion/git-bug
  install -Dm 644 misc/zsh_completion/git-bug "$pkgdir"/usr/share/zsh/site-functions/_git-bug
  for f in doc/man/*.1; do gzip -n9f $f; done
  install -Dm 644 -t "$pkgdir"/usr/share/man/man1 doc/man/*.1.gz
  install -Dm 644 -t "$pkgdir"/usr/share/doc/git-bug README.md
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/git-bug LICENSE
}
