# Maintainer: stig_atle <stigatle\\at//cryptolab\\dot//net>
# Contributor: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk> 

pkgname='yaics-git'
_pkgname=identicurse
pkgver=20170423
pkgrel=2
pkgdesc="QT based GNUSocial/status.net client - latest git revision"
arch=('any')
url="https://gitlab.com/stigatle/yaics"
license=('GPL3')
depends=('qt5-base')
provides=('yaics')
optdepends=('aspell')
makedepends=('git' 'make' 'gcc')

_gitroot="https://gitlab.com/stigatle/yaics.git"

_gitname="yaics"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"

    cd "$srcdir/$_gitname"

    msg ""

    msg "Starting make..."

	qmake-qt5

	make -j4
	}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	mkdir -p "$pkgdir/usr/share/appdata/"
	install -m 755 -p "yaics" "$pkgdir/usr/bin/yaics"
	install -m 644 -p "yaics.desktop" "$pkgdir/usr/share/applications/"
	install -m 644 -p "icons/32x32/yaics.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	install -m 644 -p "icons/48x48/yaics.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	install -m 644 -p "icons/64x64/yaics.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	install -m 644 -p "yaics.appdata.xml" "$pkgdir/usr/share/appdata/"
	

}
