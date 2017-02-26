# Maintainer: Solomon Choina <youremail@domain.com>
pkgname=vera-desktop-environment
pkgver=1.10.3
pkgrel=1
_pkgrel=1
gitname=vera-desktop
_gitname=vera
release=devel
pkgdesc="simple, lightweight, GTK3 based desktop environment" 
arch=('i686' 'x86_64')
url="https://github.com/vera-desktop/vera"
license=('GPL2.1')
depends=('vala' 'libpeas' 'gtk3' 'libgee06' 'vera-xsettings-git' 'gobject-introspection'  'libxss-vapi-git')
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
source=(https://github.com/$gitname/$_gitname/archive/$release/$pkgver-$_pkgrel.tar.gz) 
md5sums=('95d5161c5a9a17cf6dfffec038795e11')

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
