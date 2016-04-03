# Contributor: Hy Goldsher <hyness-at-gmail>
pkgname=retrofe
pkgver=0.6.165
pkgrel=3
pkgdesc="A cross-platform frontend designed for MAME cabinets/game centers/etc. with a focus on simplicity and customization"
arch=('i686' 'x86_64')
url="http://www.retrofe.com"
license=('GPL3')
depends=('glib2' 'zlib' 'gstreamer0.10-good' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake' 'mercurial' 'python2')
source=('hg+https://bitbucket.org/teamretro/retrofe#branch=default'
	$pkgname.desktop
	'icon.png')
md5sums=('SKIP' 
	'd98dfab0f0209e18769191d5755b2feb' 
	'229f9ddd063de953ab165ab10ce73717')
install=$pkgname.install

build() {
	cd $pkgname
	cmake RetroFE/Source -BRetroFE/Build -DVERSION_MAJOR=0 -DVERSION_MINOR=0 -DVERSION_BUILD=0
	cmake --build RetroFE/Build
	python Scripts/Package.py --os=linux --build=full
}
package() {
	install -d $pkgdir/{opt,usr/bin}
        install -dm777 $pkgdir/opt/retrofe
	cp -r $srcdir/$pkgname/Artifacts/linux/RetroFE/* $pkgdir/opt/retrofe
        chmod -R a+w $pkgdir/opt/retrofe/{collections,layouts,launchers}
	ln -s /opt/retrofe/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
	install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/$pkgname.png
}
