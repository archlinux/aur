# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
 
pkgname=sox-ng-git
pkgver=14.5.0.2.r264.gd8400bb9
pkgrel=1
pkgdesc="sox_ng is another Swiss Army Knife of sound processing utilities. It can convert audio files to other popular audio file types and also apply sound effects and filters during the conversion"
arch=('x86_64' 'x86_64_v3' 'x86_64_v4' 'aarch64')
license=('GPL' 'LGPL2.1')
depends=(
  'file'
  'gcc-libs'
  'gsm'
  'libid3tag'
  'libltdl'
  'libpng'
  'zlib'
)
makedepends=(
  'alsa-lib'
  'autoconf-archive'
  'flac'
  'git'
  'lame'
  'libao'
  'libmad'
  'libpulse'
  'libsndfile'
  'libvorbis'
  'opencore-amr'
  'opusfile'
  'twolame'
  'wavpack'
)
checkdepends=('time')
optdepends=(
  'alsa-lib: alsa plugin'
  'flac: flac plugin'
  'lame: mp3 plugin'
  'libao: ao plugin'
  'libmad: mp3 plugin'
  'libpulse: pulse plugin'
  'libsndfile: caf, fap, mat4, mat5, paf, pvf, sd2, sndfile, w64 and xi plugins'
  'libvorbis: vorbis plugin'
  'opencore-amr: amr_nb and amr_wb plugins'
  'opusfile: opus plugin'
  'twolame: mp3 plugin'
  'wavpack: wavpack plugin'
)
url="https://codeberg.org/sox_ng/sox_ng"
source=("$pkgname::git+https://codeberg.org/sox_ng/sox_ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^sox_ng.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"/src
  echo "$pkgname"/src
  
#  msg2 "Implementing DSD patches"
#  while read patch; do
#  echo "Applying $patch"
#  git apply $patch || exit 2
#  done <<< $(ls ../../../*.patch)
}

build() {
cd "$pkgname"
autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc \
  --with-distro="Arch Linux"
make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
