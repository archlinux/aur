# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.2.17
pkgrel=3
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
         'libldap' 'pcre' 'bzip2' 'procps-ng' 'gconf' 'perl' 'perl-xml-parser' 'perl-xml-xpath')
optdepends=()
makedepends=('doxygen' 'automake' 'acl')
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('56d11d9bd3d61b6edf7368636344ff72')


build() {
	cd "$pkgname-$pkgver"
	CPPFLAGS="-I/usr/include/python3.7m" ./configure --disable-valgrind --disable-python --enable-python3 --prefix=/usr 
	make # -j4
}

# Notice: It may take a long time to complete the check.
# check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# That's what the guideline says.
	mv $pkgdir/usr/libexec/* $pkgdir/usr/lib/$pkgname/
	rm -fr $pkgdir/usr/libexec/
}
