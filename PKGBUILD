pkgname=foundationdb-server-bin
pkgver=6.2.20
pkgrel=1
pkgdesc="FoundationDB server. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains the server."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('foundationdb')
depends=('glibc>=2', 'coreutils>=8', 'tar>=1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.foundationdb.org/downloads/${pkgver}/ubuntu/installers/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('e7370c4f8501c6acb9d4d829311bb6afedcd09df1866a65e29702316852b5b52')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

	mkdir "${pkgdir}/usr/bin"
	mv "${pkgdir}/usr/sbin/fdbserver" "${pkgdir}/usr/bin/fdbserver"
	rmdir "${pkgdir}/usr/sbin" || true
	sed -i "s,/usr/sbin,/usr/bin," "${pkgdir}/etc/foundationdb/foundationdb.conf"
}
