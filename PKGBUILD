# Maintainer: Your Name <youremail@domain.com>
pkgname=mkhexgrid
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Hex Grid Creator"
arch=("x86_64")
url="http://www.nomic.net/~uckelman/mkhexgrid/"
license=('GPL')
groups=()
depends=("gd")
makedepends=("boost")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.nomic.net/~uckelman/mkhexgrid/releases/mkhexgrid-0.1.1.src.tar.bz2")
noextract=()
md5sums=("5a0bdedbee65c97144288cd91e4415db")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	cat <<'EOF' | patch -p2
--- src/mkhexgrid-0.1.1/mkhexgrid.cpp	2007-01-10 07:37:42.000000000 -0600
+++ src/mkhexgrid-0.1.1/mkhexgrid.cpp	2016-09-18 21:30:27.153331541 -0500
@@ -148,7 +148,7 @@
       Grid g(opt);
       g.draw();
    }
-   catch (exception &e) {
+   catch (std::exception &e) {
       cerr << argv[0] << ": " << e.what() << endl;
       exit(1);
    }
EOF
	cat <<'EOF' | patch -p2
--- src/mkhexgrid-0.1.1/png.cpp	2007-01-10 07:37:42.000000000 -0600
+++ src/mkhexgrid-0.1.1/png.cpp	2016-09-18 21:39:16.996664397 -0500
@@ -24,6 +24,7 @@
 #include <exception>
 #include <stdexcept>
 #include <string>
+#include <cstring>
 #include <sstream>
 using namespace std;
EOF
}
build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}
