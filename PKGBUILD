# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <youremail@domain.com>
pkgname=ojg-git
pkgver=v1.18.5.r0.g2d0aafc
pkgrel=1
epoch=
pkgdesc="Optimized JSON for Go"
arch=(any)
url="https://github.com/ohler55/ojg"
license=('MIT')
groups=()
depends=()
makedepends=(go git)
checkdepends=()
optdepends=()
provides=(oj)
conflicts=(ojg)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ohler55/ojg.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

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
