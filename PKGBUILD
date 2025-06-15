pkgname=commitlint-go
_pkgname=commitlint
pkgver=v1.0.0
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
