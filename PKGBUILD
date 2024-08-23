# Maintainer: Levitaitng <me@levitati.ng>
pkgname=telodendria-git
pkgver=0.3.0.r140.ge263eca
pkgrel=1
pkgdesc="Telodendria Matrix homeserver"
arch=("any")
url="https://git.telodendria.io"
license=('MIT')
depends=(cytoplasm)
provides=(telodendria)
source=("$pkgname::git+https://git.telodendria.io/Telodendria/Telodendria"
        "telodendria.service")
noextract=()
sha256sums=('SKIP'
            '194b1af3a980fa1567bfa4a9d869d4fb3169a4166caa578e570e5371d8077194')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/Telodendria.//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
	cd "$pkgname"
	./configure --prefix="$pkgdir/usr"
	make || make
}

package() {
	cd "$pkgname"
	install -D "$srcdir/telodendria.service" "$pkgdir/usr/lib/systemd/system/telodendria.service"
	mkdir -p "$pkgdir/var/lib/telodendria"
	make install
}
