# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=18.12.26
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://zaps166.sourceforge.net/?app=QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('make' 'gcc' 'pkg-config' 'qt5-tools' 'cmake' 'fakeroot')
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz")
sha1sums=(4e5a320ab2403fc1463e013e9c7975f88a145a4a)

prepare()
{
	mkdir -p $srcdir/QMPlay2-build
}

build()
{
	# Uncomment below line if you don't want to have 'libsidplayfp' dependency and remove it from 'depends' list
	#USE_SIDPLAYFP='-DUSE_CHIPTUNE_SID=OFF'

	# Uncomment below line if you want to use 'jemalloc' and add it to 'depends' list
	#USE_JEMALLOC='-DUSE_JEMALLOC=ON'

	cd $srcdir/QMPlay2-build
	cmake ../QMPlay2-src-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_LINK_TIME_OPTIMIZATION=ON $USE_JEMALLOC $USE_SIDPLAYFP
	time make
}

package()
{
	cd $srcdir/QMPlay2-build
	make DESTDIR=$pkgdir install
}
