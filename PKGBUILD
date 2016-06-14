# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=16.06.01
pkgrel=2
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://qt-apps.org/content/show.php/QMPlay2?content=153339'
license=('LGPL')
depends=('qt5-base' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'xdg-utils')
optdepends=('pulseaudio' 'youtube-dl' 'patch')
makedepends=('make' 'gcc' 'pkg-config')
source=("http://downloads.sourceforge.net/project/zaps166/QMPlay2/QMPlay2-src-${pkgver}.tar.xz"
        "fix-crash-caused-by-division-by-0.patch"
)
sha256sums=(77857bc4a5cf1f0278371d825ab202eb034a0e32c0afafac9bd187904ae77979
            ad0b4cc20d46ccedacb50d933b62a2321f6e2ef3fbda7f998371289a9c30937d
)
install=$pkgname.install

build()
{
	cd $srcdir/QMPlay2-src-$pkgver
	patch -p1 < ../fix-crash-caused-by-division-by-0.patch
	QT_SUFFIX=-qt5 SYSTEM_BUILD=1 ./compile_unix 0
}

package()
{
	mv $srcdir/QMPlay2-src-$pkgver/app $pkgdir/usr
	mkdir -p $pkgdir/usr/share/mime/packages
	cp $srcdir/QMPlay2-src-$pkgver/src/gui/Unix/x-*.xml $pkgdir/usr/share/mime/packages
}
