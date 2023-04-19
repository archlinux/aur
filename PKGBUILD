# Maintainer: Karl Ljungkvist (k DOT ljungkvist AT gmail DOT com>
pkgname=snmp++
pkgver=3.5.0
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
sha512sums=('7950be5d8c825446a6d047674f528bf0d4d815ca6f8e6b79b28a8a14aaacd5386824fb5c8e70dc32abc005930d7ec7ef73cfee7ae15c097a82d02efe71ecf421')
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
