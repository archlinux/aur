# Maintainer: mehalter <micah at mehalter.com>
# Maintainer: OpenPrivacy <maildrop AT comedia DOT com>
# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.3.7
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
sha512sums=('64dcceadbbb5b6045d2ebaca89287c80c26e05d7247fc0dd31cd9bff98398c7a26d6ed0e9191dcd2fd01f0711181f15d34fe9784bd043ccd0854baa17397cd88')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake ../
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
