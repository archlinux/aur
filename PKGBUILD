# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=ygopro-bin
pkgver=1.033.A
pkgrel=3
_pkgrel=2
pkgdesc="YGOPRO is a free online dueling system made for playing Yu-Gi-Oh! duels."
arch=('x86_64')
url='https://github.com/cromerc/ygopro'
license=('GPL2')
depends=('openal' 'openssl' 'freetype2' 'libevent' 'sfml' 'libgit2')
backup=(opt/ygopro/system.conf)
source=("https://github.com/cromerc/ygopro/archive/${pkgver}-${_pkgrel}.tar.gz"
        ygopro.sh)
sha256sums=('f67dc54506f6f41e9463958283ab980fffb364bb10e783a8b46f5ad3b6233c59'
            '706523e0c9732107e889cb20f3eece86096791237a959847bcd1debbdeb09532')
options=('!strip' 'emptydirs')
install=${pkgname}.install

package() {
	cd "${srcdir}/ygopro-${pkgver}-${_pkgrel}"
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
	ln -s libsfml-audio.so.2.4 libsfml-audio.so.2.3
	ln -s libsfml-system.so.2.4 libsfml-system.so.2.3

    install -DTm755 ${srcdir}/ygopro.sh ${pkgdir}/usr/bin/ygopro
}
