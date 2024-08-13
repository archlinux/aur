# Maintainer: mehalter <micah at mehalter.com>
# Maintainer: OpenPrivacy <maildrop AT comedia DOT com>
# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.4.0
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
sha512sums=('93229826010b2034cb03f34f40c875fc667820b5f7c6332778a908aceeb2a15b5151abd0491c167ed83baff0c4bec3aa1425e40702eda8113a6d1885cb356a03')

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
