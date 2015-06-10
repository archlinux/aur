# Maintainer: Peter Lamby <peterlamby at web.de>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname="murmur-static"
pkgver=1.2.8
pkgrel=2
pkgdesc="The voice chat application server for Mumble (static version)"
arch=("i686" "x86_64")
url="http://www.mumble.info/"
license=("GPL")
optdepends=("zeroc-ice: remote scripting support")
conflicts=("murmur" "murmur-git" "murmur-ice")
options=("!strip")
backup=("etc/murmur.ini")
install="murmur.install"
source=("http://mumble.info/snapshot/murmur-static_x86-$pkgver.tar.bz2" 
        "murmur.service"
        "murmurd.1")
md5sums=('ba153ee7c36af6920e4d3317e273f190'
         'd27a9adcd7561859e7b033046729bc0e'
         '1c976acaa7657a0b319e20c1a269e732')

#build() {
#	# dummy
#}

package() {
	cd "${srcdir}/${pkgname}_x86-$pkgver"

	sed -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
	    -e "s|dbus=session|#dbus=session|" \
	    -e "s|#logfile=murmur.log|logfile=|" \
	    -e "s|#uname=|uname=murmur|" \
	    -i murmur.ini

	install -dm755 ${pkgdir}/var/lib/murmur
	install -Dm755 murmur.x86 ${pkgdir}/usr/bin/murmurd
	install -Dm644 murmur.ini ${pkgdir}/etc/murmur.ini
	install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
	install -Dm644 ${srcdir}/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
	install -Dm644 ${srcdir}/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

