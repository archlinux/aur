pkgname=gometalinter
pkgver=2
pkgrel=1
pkgdesc="golang meta linter"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')

source=(
	"gometalinter"
)

depends=('go' 'git')

backup=(
)

build() {
    export GOPATH="$srcdir/"
    go get -u -v gopkg.in/alecthomas/gometalinter.v2
    $srcdir/bin/gometalinter.v2 --install
}

package() {
    find "$srcdir/bin/" -type f -executable | while read filename; do
        install -DT "$filename" "$pkgdir/usr/bin/gometalinters/$(basename $filename)"
    done
    install -DT $srcdir/gometalinter "$pkgdir/usr/bin/gometalinter"
}
md5sums=('a4c9ed1531b6555e6bc9a2140b6218c2')
