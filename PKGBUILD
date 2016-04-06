# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.2.8
pkgrel=1
pkgdesc="Open Source Security Compliance Solution"

# i686 is theoretically bulitable, if anyone needs it
arch=('x86_64')
url="www.open-scap.org"
license=('GPL')

# The official site suggested the dependencies in terms of Fedora's rpm.
# Some of the corresponding packages in Arch remain unclear, which are listed 
# here for now.
# packege missing: libselinux-devel, perl-XML-XPath
depends=('swig' 'python' 'acl' 'libcap' 'curl' 'libgcrypt' 'libxml2' 'libxslt'
         'libldap' 'pcre' 'perl-xml-parser' 'perl' 'bzip2' 'procps-ng' 'gconf')

optdepends=()
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d26a148d834635363ac8cdd707828302')

build() {
	cd "$pkgname-$pkgver"
	CPPFLAGS="-I/usr/include/python3.5m" ./configure --enable-probes-linux --disable-python --enable-python3 --prefix=/usr
	make -j4
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mv $pkgdir/usr/libexec/* $pkgdir/usr/lib/$pkgname/
	rm -fr $pkgdir/usr/libexec/
}
