# Maintainer: Solomon Choina <youremail@domain.com>
pkgname=vera-desktop-environment
pkgver=1.0.6
pkgrel=1
_pkgrel=1
gitname=vera-desktop
_gitname=vera
release=release-7
pkgdesc="simple, lightweight, GTK3 based desktop environment" 
arch=('i686' 'x86_64')
url="https://github.com/vera-desktop/vera"
license=('GPL2.1')
depends=('vala' 'libpeas' 'gtk3' 'libgee06' 'vera-xsettings-git' 'gobject-introspection  libxss-vapi-git')
makedepends=('bake')
optdepends=('opensnap-git'
            'pcmanfm'
	    'volumeicon'
	    'xscreensaver')
provides=(vera-desktop-environment-git)
conflicts=(vera-desktop-environment-git)
replaces=(vera-desktop-environment-git)
backup=()
options=()
install=vera-desktop-environment.install
source=https://github.com/$gitname/$_gitname/archive/$release/$pkgver-$_pkgrel.tar.gz 
md5sums=('8f7c5e7971a2860564b3e261d83304de')

prepare() {
     mv "$_gitname-$release-$pkgver-$_pkgrel" "$pkgname-$pkgver"
}
build() {
	cd "$pkgname-$pkgver"
	bake --configure install-directory="$pkgdir/"
}

package() {
    cd "$pkgname-$pkgver"
	bake install
    mkdir -p $pkdir/usr/share/vera/autostart
    cd data/autostart
    cp *.desktop $pkgdir/usr/share/vera/autostart/
    cd ..
    cd applications
    cp *.desktop $pkgdir/usr/share/applications/
}
