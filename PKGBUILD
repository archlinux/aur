# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=cljcv-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Produce a nicely formatted curriculum vitae or résumé in various formats."
arch=('any')
url="https://github.com/logankoester/cljcv"
license=('MIT')
depends=('java-runtime')
makedepends=('clojure')
checkdepends=()
optdepends=()
provides=()
conflicts=(cljcv)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git+https://github.com/logankoester/cljcv.git' 'cljcv.run')
noextract=()
md5sums=('SKIP' '5cd733e466e2ff9e4ac23961cc64115d')
validpgpkeys=()

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
        lein uberjar
}

package() {
	cd "$pkgname"
        install -Dm644 target/uberjar/cljcv-${pkgver}-standalone.jar ${pkgdir}/usr/share/java/cljcv/cljcv-standalone.jar
        install -Dm755 ${srcdir}/cljcv.run ${pkgdir}/usr/bin/cljcv
}
