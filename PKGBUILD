# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

pkgname=gpodder3
_pkgname=gpodder
pkgver=3.9.2
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
conflicts=('gpodder' 'gpodder2' 'gpodder-git')
depends=('iproute2' 'pygtk' 'python2-dbus' 'python2-podcastparser' 'python2-mygpoclient')
makedepends=('intltool' 'imagemagick' 'help2man')
optdepends=('libgpod: for ipod support'
            'lame: for converting ogg to mp3'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'pywebkitgtk: html shownotes/flattr integration'
            'python2-eyed3: for ipod support'
            'ffmpeg: transcode audio files to mp3/ogg'
            'mutagen: audio tagging'
            'python2-html5lib: clickable links')
source=("${_pkgname}-${pkgver}.tar.gz::http://${_pkgname}.org/source/${pkgver}")
install=gpodder.install

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PYTHON=python2 DESTDIR=${pkgdir} make install || return 1

  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' \
         -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find $pkgdir/usr/lib/python2.7/site-packages/gpodder/ -name '*.py')
}
md5sums=('14b9c9ca26015d78f11a748e4cbf65a5')
sha1sums=('1778cd758143dcee980fad7f85707c170f1c7db2')
sha256sums=('927bad1e895c7ba32e6c1247043e661ed12d577990692ad5a19f9d9c2c1220b5')
