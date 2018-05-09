# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=ygopro
pkgver=1.033.7
pkgrel=3
pkgdesc="YGOPRO is a free online dueling system made for playing Yu-Gi-Oh! duels."
arch=('i686' 'x86_64')
url='https://github.com/cromerc/ygopro'
license=('GPL2')
depends=('openal' 'openssl' 'freetype2' 'libevent' 'lua52' 'libcurl-compat')
backup=(opt/ygopro/system.conf)
source=("https://github.com/cromerc/ygopro/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('31926636827ececbbbbedb3589fe18a847fedad2845fa08ae2083871200923ec')
options=('!strip' 'emptydirs')

package() {
	cd "${srcdir}/ygopro-${pkgver}-${pkgrel}"
	mkdir -pv "$pkgdir/usr/share/pixmaps"
	mkdir -pv "$pkgdir/usr/share/applications"
	mv -v "YGOPro.png" "$pkgdir/usr/share/pixmaps/YGOPro.png"
	mv -v "YGOPro.desktop" "$pkgdir/usr/share/applications/YGOPro.desktop"
	mkdir -pv "$pkgdir/opt/ygopro"
	cp -dRv * "$pkgdir/opt/ygopro"
	cd "$pkgdir/opt/ygopro"
	find "$pkgdir/opt/ygopro" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/ygopro" -type f -exec chmod 777 {} \;
	mkdir -pv "$pkgdir/usr/lib"
	cd "$pkgdir/usr/lib"
	ln -s liblua5.2.so liblua5.2.so.0
}

post_remove() {
	rm -R /opt/ygopro
}
