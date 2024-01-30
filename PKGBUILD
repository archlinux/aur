pkgname=foundationdb-server-bin
pkgver=7.3.27
pkgrel=1
pkgdesc="FoundationDB server. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains the server."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('foundationdb')
depends=('glibc>=2', 'coreutils>=8', 'tar>=1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
# Remove DLAGENTS once apple can fix their stuff https://bbs.archlinux.org/viewtopic.php?id=262737
DLAGENTS=("https::/usr/bin/curl -Lk -o %o %u")
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('dd5ec6b906010444dfcaa17af3db6fc1e3a91c88fe4828e1697ab0cb0c0c2310')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

	mkdir "${pkgdir}/usr/bin"
	mv "${pkgdir}/usr/sbin/fdbserver" "${pkgdir}/usr/bin/fdbserver"
	rmdir "${pkgdir}/usr/sbin" || true
	sed -i "s,/usr/sbin,/usr/bin," "${pkgdir}/etc/foundationdb/foundationdb.conf"
}
