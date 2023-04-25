# Maintainer: Karl Ljungkvist (k DOT ljungkvist AT gmail DOT com>
pkgname=snmp++
pkgver=3.3.9
pkgrel=1
epoch=
pkgdesc="SNMP C++ library from Agentpp"
arch=('x86_64' 'i686')
url="https://agentpp.com/api/cpp/snmp_pp.html"
license=('BSD')
groups=()
depends=(openssl)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://agentpp.com/download/$pkgname-$pkgver.tar.gz"
        )
sha512sums=('19109a96b92a2c9a112141fec441e3fb47d12d97f935312422b695d1fee5ee66438210394b0c08f5ed0f97d52ca0f2b295d8f9a6a14e1f7e974cfe4e0b19590e')
noextract=()
validpgpkeys=()

#prepare() {}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	cd "${srcdir}/${pkgname}-${pkgver}"
        head -n26 libsnmp.h >> LICENSE_snmp++
        install -D LICENSE_snmp++ "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        rm LICENSE_snmp++
}
