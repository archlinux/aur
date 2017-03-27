_projname=arping
_suffix=-th # this is to avoid clashing with iputils
pkgname=${_projname}${_suffix}
pkgver=2.16
pkgrel=1
pkgdesc="ARP Ping from Thomas Habets"
arch=('i686' 'x86_64')
url="http://www.habets.pp.se/synscan/programs.php"
license=('GPL')
depends=('libnet' 'libcap' 'libpcap')
source=("https://github.com/ThomasHabets/${_projname}/archive/${_projname}-${pkgver}.tar.gz")
sha1sums=('a6a33da6853cab19a8cfa389117e8a6c1c68ce26')

prepare() {
	cd "${_projname}-${_projname}-$pkgver"
	autoreconf -i
}

build() {
	cd "${_projname}-${_projname}-$pkgver"
	./configure --prefix=/usr --program-suffix=${_suffix} --sbindir=/usr/bin
	make
}

package() {
	cd "${_projname}-${_projname}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
