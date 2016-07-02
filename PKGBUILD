# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=16.07.02
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://zaps166.sourceforge.net/?app=QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'xdg-utils')
optdepends=('pulseaudio: PulseAudio support'
            'youtube-dl: Better YouTube support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('make' 'gcc' 'pkg-config' 'qt5-tools' 'cmake')
source=("http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz")
sha256sums=(20d820b996cf66b832ab6339515e1fbb41da0b048713db0fa7f96a7e587dbd00)
install=$pkgname.install

build()
{
	# Uncomment below line if you don't want to have 'libsidplayfp' dependency and remove it from 'depends' list
	#USE_SIDPLAYFP='-DUSE_CHIPTUNE_SID=OFF'

	# Uncomment below two lines if you want to use 'jemalloc' and add it to 'depends' list
	#unset LDFLAGS
	#USE_JEMALLOC='-DUSE_JEMALLOC=ON'

	cd $srcdir
	mkdir -p QMPlay2-build
	cd QMPlay2-build
	cmake ../QMPlay2-src-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_QT5=YES $USE_JEMALLOC $USE_SIDPLAYFP
	time make
}

package()
{
	cd $srcdir/QMPlay2-build
	make DESTDIR=$pkgdir install
}
