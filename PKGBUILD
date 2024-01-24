# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=soundkonverter
pkgver=3.0.1
pkgrel=9
pkgdesc='Front-end to various audio converters'
arch=(x86_64)
url='https://www.linux-apps.com/content/show.php?content=29024'
license=(GPL)
depends=(cdparanoia
         kdelibs4support
         libkcddb5
         phonon-qt5
         taglib)
makedepends=(extra-cmake-modules
             kdesignerplugin
             kdoctools5
             kinit)
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
source=(https://github.com/dfaust/soundkonverter/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/dfaust/soundkonverter/commit/3760bccb.patch)
sha256sums=('92117f8aff85aac3a336cc0c94f3739aaa2d07ddd741d737dfd4b1571c60a0ce'
            '6dea893bd79d3848ba674e4735f4f5ec63b8d8b4d6a75c696e83f37876043633')

prepare() {
  patch -d $pkgname-$pkgver -p1 < 3760bccb.patch # Fix taglib cmake module
}

build() {
  cmake -B build -S $pkgname-$pkgver/src
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
