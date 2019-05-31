# Maintainer: Bradley Cicenas <bradley@vektor.nyc>
pkgname=tcolors
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
	"tcolors::git://github.com/bcicen/tcolors.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cat "$srcdir/$pkgname/VERSION"
}

build() {
	cd "$srcdir/$pkgname"

	echo "Running 'go mod download'..."
  go mod download

	echo "Running 'go build'..."
  go build -ldflags "-w -X main.version=${pkgver}-${pkgrel}" -o tcolors
}

package() {
	target="${srcdir}/${pkgname}/tcolors"
	install -DT $target "${pkgdir}/usr/bin/tcolors"
}
