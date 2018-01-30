# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder3
_pkgname=gpodder
pkgver=3.10.0
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
conflicts=('gpodder' 'gpodder2' 'gpodder-git')
depends=('python-dbus' 'python-podcastparser' 'python-mygpoclient' 'python-gobject')
makedepends=('intltool' 'imagemagick' 'help2man')
optdepends=('libgpod: for ipod support'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'lame: for converting ogg to mp3'
            'python-eyed3: for ipod support'
            'ffmpeg: transcode audio files to mp3/ogg'
            'mutagen: audio tagging'
            'webkit2gtk: HTML show notes'
            'python-html5lib: clickable links')
source=("${_pkgname}-${pkgver}.tar.gz::http://github.com/${_pkgname}/${_pkgname}/archive/${_pkgname}-${pkgver}")
install=gpodder.install

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PYTHON=python DESTDIR=${pkgdir} make install || return 1

  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python|' \
         -e 's|#!/usr/bin/env python$|#!/usr/bin/env python|' \
    $(find $pkgdir/usr/lib/python3.6/site-packages/gpodder/ -name '*.py')
}
md5sums=('2303a104690a614935f06f5c6d2ab3ef')
sha1sums=('bae623e6465f28d75c75170279ffd4e51d3769c7')
