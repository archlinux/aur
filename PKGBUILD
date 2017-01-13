# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=2.1.2.r1637.ge47a2ec3
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://audacity.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils'
         'ffmpeg'
         'lame'
         'libid3tag'
         'libmad'
         'lilv'
         'portsmf'
         'sbsms'
         'soundtouch'
         'vamp-plugin-sdk'
         'webkitgtk2'
         'wxgtk')
makedepends=('cmake' 'python2' 'twolame')
options=('!makeflags')
provides=('audacity')
conflicts=('audacity')
source=("$_pkgname::git+https://github.com/audacity/audacity.git"
		'audacity-ffmpeg.patch')
sha1sums=('SKIP'
          '5f1733a3802bcec7d9b54cb3ec8d7d81fc38fc61')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "${srcdir}/audacity-ffmpeg.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --with-libsamplerate
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
