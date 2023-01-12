# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=github-markdown-toc-go
pkgver=1.2.0
pkgrel=1
pkgdesc='Easy TOC creation for GitHub README.md - golang implemerntation'
arch=('any')
url='https://github.com/ekalinin/github-markdown-toc.go'
makedepends=('git' 'go')
provides=('github-markdown-toc')
conflicts=('github-markdown-toc')
license=('MIT')
source=("git+${url}.git#branch=${BRANCH:-master}")
sha1sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}


build() {
  cd "$srcdir/github-markdown-toc.go"
  go build -race -o gh-md-toc cmd/gh-md-toc/main.go
}

package() {
  cd "$srcdir/github-markdown-toc.go"
  install -Dm755 gh-md-toc -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
