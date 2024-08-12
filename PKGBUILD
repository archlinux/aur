# Maintainer: mehalter <micah at mehalter.com>
# Maintainer: OpenPrivacy <maildrop AT comedia DOT com>
# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.3.10
pkgrel=1
pkgdesc="Open Source Security Compliance Solution"

# i686 is theoretically bulitable, if anyone needs it
arch=('x86_64')
url="https://www.open-scap.org/"
license=('GPL')

# The official site suggested the dependencies in terms of Fedora's rpm.
# Some of the corresponding packages in Arch remain unclear, which are listed
# here for now.
# packege missing: libselinux-devel
depends=('swig' 'python' 'acl' 'libcap' 'curl' 'libgcrypt' 'libxml2' 'libxslt'
	'libldap' 'pcre' 'bzip2' 'procps-ng' 'gconf' 'perl' 'perl-xml-parser'
	'perl-xml-xpath' 'xmlsec')
optdepends=()
makedepends=('doxygen' 'cmake')
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('007556b8f020636f6613c2b1192a8b96dfb21b62994a3e257619d48021ad962f95b724c3ac9709a60dbbf7dba8f2499ff8b9b56a7f2d293ca3a8d6ec8107f595')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

# Notice: It may take a long time to complete the check.
# check() {
# cd "$pkgname-$pkgver"
# make check
#}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
}
