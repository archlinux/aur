# Maintainer: Peter Lamby <peterlamby at web.de>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname="murmur-static"
pkgver=1.2.19
pkgrel=1
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
sha512sums=('a43a09aaa86cc18b1a62a5b316a93a53d93040ef3d25b57d2c7da526cdf338eea48902d97c221c4d1dd5d8f653c48cb86b6d626b01671ed74bd23830bee700db'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            '98bcb96e98b3cdbd07be20774978bd309e7cbc3279e0bbf5682794689d7ad5aeb09bb332540c965f5d93be61bdbd9e23fd9074d9b1a4ff2d55c6176365f69142')

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

