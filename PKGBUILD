# Maintainer: Bradley Cicenas <bradley@vektor.nyc>
pkgname=tcolors
_pkgname=tcolors
pkgver=0.1
pkgrel=1
pkgdesc="Commandline color picker and palette builder"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/bcicen/tcolors'
depends=()
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/bcicen/tcolors.git#tag=v${pkgver}"
)

md5sums=('SKIP')
backup=()

pkgbuild() {
	git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
	cd "$srcdir/$pkgname"

	echo "Running 'go mod download'..."
	go mod download

	echo "Running 'go build'..."
	go build -ldflags "-w -X main.version=${pkgver}-${pkgrel} -X main.build=$(pkgbuild)" -o tcolors
}

package() {
	target="${srcdir}/${pkgname}/tcolors"
	install -DT $target "${pkgdir}/usr/bin/tcolors"
}
