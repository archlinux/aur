# Maintainer: Andrew Hills <ahills@ednos.net>
pkgname=hosts-gen
pkgver=0.9
# No actual releases provided; find the right commit and download a snapshot from cgit
_pkgcommit=d3015d319d378390139455731b974569fbc2cd40
pkgrel=1
epoch=
pkgdesc="A little framework to generate /etc/hosts from /etc/hosts.d"
arch=('any')
url="http://git.r-36.net/$pkgname/"
license=('GPL3')
groups=()
depends=('coreutils')
backup=()
options=()
install="$pkgname.install"
source=("http://git.r-36.net/$pkgname/snapshot/$pkgname-$_pkgcommit.tar.bz2"
        "$pkgname-$pkgver-usr-bin.patch"
				"$pkgname-$pkgver-doc.patch")
md5sums=('534edf642f15df0a073a716967724065'
         'd05c8b504ace226881e800cbad95ac9b'
         'bb63beb2068c3aac04caefaa2ee926b6')
validpgpkeys=()

prepare() {
	cd "$pkgname-$_pkgcommit"
	for patchname in usr-bin doc; do
		patch -p1 < "$srcdir/$pkgname-$pkgver-$patchname.patch"
	done
}

package() {
	cd "$pkgname-$_pkgcommit"
	make DESTDIR="$pkgdir/" install
	# Generate this from /etc/hosts on install
	rm "$pkgdir/etc/hosts.d/01-hosts.local"
}
