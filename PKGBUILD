# Mantainer: 3ED <krzysztof1987@gmail.com>

pkgname=mixramp
pkgver=1.3
pkgrel=4
pkgdesc="A utility to analyse sound files and print out the volume profile of the start and end. The idea is to embed those profiles in metadata so players can do intelligent mixing between tracks. Supports FLAC, OGG and MP3."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mixramp/"
license=('GPL')
depends=('audiofile')
optdepends=('python2-eyed3: writer for mp3 tags'
            'mpg123: mp3 decoder, needed to perform mixramp analysis'
            'flac: decoder and writer for flac tags'
            'vorbis-tools: decoder and writer for ogg/vorbis tags'
            'mpd: player which support mixramp tags')
source=("${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}_${pkgver}.tgz/download"
        "01-without-werror.patch"
        "02-fix-eyed3-args.patch"
        "03-ogg-support.patch"
        "04-oggcomments-overwrite-policy.patch")
sha256sums=('6d01a0ce0907a7fd225840a21d39144a113b551d176439964bdb5351aecf724c'
            '9f6e34a9c7a59e9723a2d003c5008670e89f73aef8494849e6ec5a729882abf8'
            'cc939c0bc1bacf7f1716a1fec972d3f8fbc316e0d891dc61cc4e5e86279e2942'
            'ac3200d3915052bc2962758d44f2578e08459000a2b4af3177a779e1e8582a12'
            '059d700a6e11cf9becc4cfce4286c0182bccc84b03afd6434195d2b4f6b45079')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p0 -i "$srcdir"/01-without-werror.patch
  patch -p0 -i "$srcdir"/02-fix-eyed3-args.patch
  patch -p0 -i "$srcdir"/03-ogg-support.patch
  patch -p0 -i "$srcdir"/04-oggcomments-overwrite-policy.patch
}
build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir"/usr/bin/
  install -m755 mixramp mixramp-tag "$pkgdir"/usr/bin/
}
