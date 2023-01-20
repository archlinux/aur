# Maintainer: Phantasm <phantasm@centrum.cz>
# Based on the official Arch Linux PKGBUILD

pkgname=soundkonverter-dark-theme-git
_name=soundkonverter
pkgver=3.0.1.r28.ge2927e9
pkgrel=1
pkgdesc="Front-end to various audio converters (Git - with custom colors for dark themes)"
arch=(x86_64)
url="https://www.linux-apps.com/content/show.php?content=29024"
license=(GPL)
depends=(hicolor-icon-theme kdelibs4support libkcddb taglib phonon-qt5)
makedepends=(extra-cmake-modules kdesignerplugin kdoctools kinit git)
optdepends=('faac: faac backend'
            'faad2: faad backend'
            'ffmpeg: ffmpeg backend'
            'flac: flac backend'
            'fluidsynth: flouidsynth backend'
            'lame: lame backend'
            'mac: mac backend'
            'mplayer: mplayer backend'
            'opus-tools: opus backend'
            'speex: speexenc, speexdec backends'
            'timidity++: midi backend'
            'twolame: twolame backend'
            'vorbisgain: vorbisgain backend'
            'vorbis-tools: vorbis tools backend'
            'wavpack: wavpack backend'
            'sox: sox plugin (change sample rate, various effects)')
source=("git+https://github.com/nphantasm/soundkonverter.git")
provides=(soundkonverter)
conflicts=(soundkonverter)
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../"$_name"/src
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
