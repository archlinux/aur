# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>
# Contributor: David H. Bronke <whitelynx at gmail.com>
pkgname='fastoggenc'
pkgver=0.1.4
pkgrel=5
pkgdesc="A parallelized Python script which converts MP3, M4A, WMA, WAV into OGG Vorbis"
arch=('any')
url="http://sourceforge.net/projects/fastoggenc/"
depends=(mplayer mpg123 lame flac faad2 vorbis-tools mutagen)
optdepends=(
  'musepack-tools: for decoding Musepack files'
  'wavepack: for decoding Wavepack files'
  'cdparanoia: for reading CDs'
  'cdrkit: for reading CDs'
)
license=('GPLv3')
source=("http://downloads.sourceforge.net/project/fastoggenc/$pkgver/$pkgname-$pkgver.tar.gz" shutil.patch)

prepare() {
  sed -e 's@#!/usr/bin/python@#!/usr/bin/python2@' -i "${pkgname}/${pkgname}" || return 1
  cd "${pkgname}"
  patch < "$srcdir/shutil.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/bin/" || return 1
  install -m755 -D "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/" || return 1
}

md5sums=('db8576f9d49741680c06a23940a38885'
         '160d73a3bfda66e75c8c25cf7787f6ef')
sha1sums=('91f78e026762a08ccf468de5c2e89bed717d5f96'
          '09f41f744325733a145fa65dee43ea1bfe442763')
sha256sums=('d781b558c7848f27a61362fd7abcd4065e1feb711916292d0e8e828e2a6e2a12'
            '9e0d8b2d4df6d4186241ee4a57415291d4a20cbca5e0a1f452d40a84653b2e2d')
