 
pkgname=sox-dsd-git
pkgver=sox.14.4.2.r12.gc05c760
pkgrel=1
pkgdesc="SoX Resampler library dsd branch"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libltdl' 'file' 'libsndfile' 'libpng' 'lame' 'opencore-amr' 'gsm')
makedepends=('libao' 'libmad' 'libid3tag' 'wavpack' 'libpulse' 'opusfile' 'autoconf')
optdepends=('libao: for ao plugin'
            'libmad: for mp3 plugin'
            'libid3tag: for mp3 plugin'
            'wavpack: for wavpack plugin'
            'libpulse: for pulse plugin'
	    'opusfile: for opus plugin')
provides=('sox')
conflicts=('sox')
url="http://sox.sourceforge.net/"
source=("$pkgname::git://github.com/mansr/sox")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 cd $pkgname
 autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc \
  --with-distro="Arch Linux"
 make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
