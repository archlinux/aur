
# Maintainer: Asuka Minato <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=ojg-git
pkgver=v1.18.5.r0.g2d0aafc
pkgrel=1
pkgdesc="Optimized JSON for Go"
arch=(any)
url="https://github.com/ohler55/ojg"
license=('MIT')
makedepends=(go git)
provides=(oj)
conflicts=(ojg)
source=("git+https://github.com/ohler55/ojg.git")
sha256sums=('SKIP')

pkgver() {
  cd ojg
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

check() {
	pushd ojg
	go test
}

package() {
	pushd "ojg"
	go env -w GOBIN=$pkgdir/usr/bin
	pushd cmd/oj
	go install
	popd
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
