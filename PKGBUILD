pkgname=commitlint-go-git
_pkgname=commitlint
pkgdesc='A commit message linter for conventional commits written in go'
pkgver=main.09c93b8aad964ec71a1eecf87191bae38a031402
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
