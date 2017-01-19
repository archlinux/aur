pkgname=gometalinter
pkgver=1
pkgrel=1
pkgdesc="golang meta linter"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')

source=(
	"gometalinter"
)
md5sums=('d8d3640069c485ca415ab3adb18523ef')

depends=('go' 'git')

backup=(
)

build() {
    export GOPATH="$srcdir/"
    go get -u -v gopkg.in/alecthomas/gometalinter.v1
    $srcdir/bin/gometalinter.v1 --install
}

package() {
    find "$srcdir/bin/" -type f -executable | while read filename; do
        install -DT "$filename" "$pkgdir/usr/bin/gometalinters/$(basename $filename)"
    done
    install -DT $srcdir/gometalinter "$pkgdir/usr/bin/gometalinter"
}
