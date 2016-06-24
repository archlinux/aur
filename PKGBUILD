# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-git
pkgver=16.06.23
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt5-base' 'xdg-utils' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio: PulseAudio support'
            'youtube-dl: Better YouTube support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('make' 'gcc' 'git' 'pkg-config' 'qt5-tools' 'cmake')
source=('git+https://github.com/zaps166/QMPlay2')
sha256sums=('SKIP')
install=$pkgname.install

pkgver()
{
	$srcdir/QMPlay2/version
}

build()
{
	#Uncomment below line if you don't want to have 'libsidplayfp' dependency and remove it from 'depends' list
	#USE_SIDPLAYFP='-DUSE_CHIPTUNE_SID=No'

	cd $srcdir
	mkdir -p QMPlay2-build
	cd QMPlay2-build
	cmake ../QMPlay2 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib $USE_SIDPLAYFP
	time make
}

package()
{
	cd $srcdir/QMPlay2-build
	make DESTDIR=$pkgdir install
}
