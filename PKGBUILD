# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-git
pkgver=16.04.20
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs (Qt5)'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt5-base' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'xdg-utils')
optdepends=('pulseaudio' 'youtube-dl')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('make' 'gcc' 'git' 'pkg-config' 'qt5-tools')
source=('git+https://github.com/zaps166/QMPlay2')
sha256sums=('SKIP')
install=$pkgname.install

pkgver()
{
	cat $srcdir/QMPlay2/src/qmplay2/headers/Version.hpp | grep QMPlay2Version | cut -c25-32
}

build()
{
	cd $srcdir/QMPlay2
	QT_SUFFIX=-qt5 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
	mv $srcdir/QMPlay2/app $pkgdir/usr
	mkdir -p $pkgdir/usr/share/mime/packages
	cp $srcdir/QMPlay2/src/gui/Unix/x-*.xml $pkgdir/usr/share/mime/packages
}
