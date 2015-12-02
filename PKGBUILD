pkgname=gpodder3
_pkgname=gpodder
pkgver=3.8.5
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
md5sums=('df651a331c91ebd634c0d0b5ae8f7ea2')
sha1sums=('787e7bd564ac0fd587c6fea7f17e473c4f8c4c34')
sha256sums=('f331a9af942f554a5a387a86f22f4440e4c6e58d40765090bfebd3b8d9e9a98b')
