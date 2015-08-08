# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=muttonchop
pkgver=0.1.4
pkgrel=2
pkgdesc='MuttonChop is a media player designed to be controlled through a web interface or by a JSON API'
arch=('any')
url='http://www.jezra.net/projects/muttonchop'
license=('GPL3')
depends=('gtk3' 'glib' 'json-glib' 'sqlite3' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good-plugins' 'gstreamer0.10-bad-plugins' 'gstreamer0.10-ugly-plugins' 'libgee' 'libxml2' 'gvfs')
makedepends=('make' 'cmake' 'vala' 'gcc')
provides=(muttonchop)
source=(https://launchpad.net/$pkgname/0.x/$pkgver/+download/$pkgname-$pkgver.tgz)
md5sums=(54ac74d07b64515c273eca1e67137a3c)
provides=(muttonchop)
conflicts=(muttonchop-bzr)
install=muttonchop.install


build() {
	
msg "Starting make..."
msg "Unless you have edited this PKGBUILD MuttonChop will default to a"
msg "full build, if you wish to build a headless Muttonchop, read"
msg "the PKGBUILD!"


cd $srcdir
#Set option for video play back. 
#Default to include video

cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./ || return 1

#Change the previous line to  
#cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./ -DVIDEO=OFF || return 1
#To build for no video (headless) 

make || return 1

}

package() {
make DESTDIR=$pkgdir install
mkdir -p "$pkgdir/usr/share/muttonchop/"
cp $srcdir/README  "$pkgdir/usr/share/muttonchop/" || return 1
cp -r $srcdir/data/public "$pkgdir/usr/share/muttonchop/" || return 1
}
