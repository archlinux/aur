# Contributor: Jochen Immendörfer <jochen.immendoerfer@gmail.com>
pkgname=rezound
pkgver=0.12.3beta
pkgrel=4
pkgdesc="ReZound aims to be a stable, open source, and graphical audio file editor primarily for but not limited to the Linux operating system."
url="http://rezound.sourceforge.net/"
depends=('jack-audio-connection-kit' 'fox' 'libvorbis' 'audiofile' 'soundtouch' 'fftw2double')
makedepends=('flex' 'bison')
source=(http://downloads.sourceforge.net/sourceforge/rezound/$pkgname-$pkgver.tar.gz flacpatch gcc43.patch)
md5sums=('df109c9d9ad6d27214a7417df583115d' '440991794129922eb27623a616ab3df8' '65d8d469c2c164f18849ef6ca1f64cfe')
arch=('i686')
license=('GPL')

build() {
  cd $startdir/src/$pkgname-$pkgver
	patch -p1 <../flacpatch
	patch -p1 <../gcc43.patch
  ./configure --prefix=/usr --disable-portaudio
  make || return 1
  make DESTDIR=$startdir/pkg install
}
