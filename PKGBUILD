pkgname=gpodder3
_pkgname=gpodder
pkgver=3.9.1
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
conflicts=('gpodder' 'gpodder2' 'gpodder-git')
depends=('iproute2' 'pygtk' 'python2-dbus' 'python2-feedparser' 'python2-mygpoclient')
makedepends=('intltool' 'imagemagick' 'help2man')
optdepends=('libgpod: for ipod support'
            'lame: for converting ogg to mp3'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'pywebkitgtk: html shownotes/flattr integration'
            'python2-eyed3: for ipod support'
            'ffmpeg: transcode audio files to mp3/ogg'
            'mutagen: audio tagging')
source=("${_pkgname}-${pkgver}.tar.gz::http://${_pkgname}.org/source/${pkgver}")
install=gpodder.install

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PYTHON=python2 DESTDIR=${pkgdir} make install || return 1

  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' \
         -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find $pkgdir/usr/lib/python2.7/site-packages/gpodder/ -name '*.py')
}
md5sums=('f257c2e887808e53a21787d394623764')
sha1sums=('7fd1b7f0f13bf3d672f62efc1a9e3e0550fa7046')
sha256sums=('16e63f7fe3e0d2bf51eb4313d1fcf035aac65995107644ca042e8e3ced4ed70c')
