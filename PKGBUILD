# Maintainer: wicast <wicastchen at hotmail>
# Contributor: Pablo Astigarraga <pote at tardis.com.uy>

pkgname=gvp
pkgver=0.2.1.r4.g9e48370
pkgrel=1
pkgdesc="Go Versioning Packager."
arch=("any")
url="https://github.com/pote/gvp"
license=('MIT')
groups=()
depends=("go")
makedepends=('git')
optdepends=("go-gpm: download and compile dependence with gvp")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/pote/gvp.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make test && make prefix="$pkgdir/usr" install
}
