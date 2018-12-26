# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-git
pkgver=18.12.26
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://zaps166.sourceforge.net/?app=QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('make' 'gcc' 'git' 'pkg-config' 'qt5-tools' 'cmake' 'fakeroot')
source=('git+https://github.com/zaps166/QMPlay2')
sha256sums=('SKIP')

pkgver()
{
	$srcdir/QMPlay2/version
}

build()
{
	# Uncomment below line if you don't want to have 'libsidplayfp' dependency and remove it from 'depends' list
	#USE_SIDPLAYFP='-DUSE_CHIPTUNE_SID=OFF'

	# Uncomment below line if you don't want to use 'jemalloc' and remove it from 'depends' list
	#USE_JEMALLOC='-DUSE_JEMALLOC=ON'

	# Uncomment below line for ccache
	#USE_CCACHE='-DCMAKE_CXX_COMPILER_LAUNCHER=ccache'

	cd $srcdir
	mkdir -p QMPlay2-build
	cd QMPlay2-build
	cmake ../QMPlay2 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_LINK_TIME_OPTIMIZATION=OFF $USE_CCACHE $USE_JEMALLOC $USE_SIDPLAYFP
	time make
}

package()
{
	cd $srcdir/QMPlay2-build
	make DESTDIR=$pkgdir install
}
