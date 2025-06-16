pkgname=commitlint-go-git
_pkgname=commitlint
pkgdesc='A commit message linter for conventional commits written in go'
pkgver=main.6ae32ee2e892c1e9311dd9bced54b04e57186a72
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/jurienhamaker/commitlint'
source=('git+git://github.com/jurienhamaker/commitlint')
depends=('git')
makedepends=('go')
sha1sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	GO111MODULE=on go build ./cmd/commitlint -o "$srcdir/bin/commitlint" -ldflags "-s -w -X=main.Version=$pkgver -X=main.CommitSHA=$(git rev-parse HEAD)"
}

package() {
	cd "$srcdir/bin"
	install -Dm755 'commitlint' "$pkgdir/usr/bin/commitlint"
}
