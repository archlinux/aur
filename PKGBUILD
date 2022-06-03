# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
 
pkgname=sox-dsd-git
pkgver=14.4.2.r69.g0be259ea
pkgrel=3
pkgdesc="SoX Resampler library dsd branch"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL' 'LGPL')
depends=('libltdl' 'file' 'libsndfile' 'libpng' 'lame' 'opencore-amr' 'gsm')
makedepends=('libao' 'libmad' 'libid3tag' 'wavpack' 'libpulse' 'opusfile' 'autoconf')
optdepends=('libao: for ao plugin'
            'libmad: for mp3 plugin'
            'libid3tag: for mp3 plugin'
            'wavpack: for wavpack plugin'
            'libpulse: for pulse plugin'
	    'opusfile: for opus plugin')
provides=("sox=${pkgver}")
conflicts=('sox')
url="http://sox.sourceforge.net/"
source=("$pkgname::git+https://github.com/mansr/sox")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^sox.//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
