# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gespeaker
pkgver=0.8.6
pkgrel=2
pkgdesc="A GTK+ frontend for espeak and mbrola to speech the read text."
url="http://www.muflone.com/gespeaker/"
arch=('any')
license=('GPL2')
depends=('espeak' 'librsvg' 'pygtk' 'python2-dbus' 'python2-xdg' 'alsa-utils')
optdepends=('libpulse: PulseAudio output')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8449994d818e4ab833fccea2e595c4be6f3ed436b8f4f7d7bd824c948ddb3f477d6a87bcf56276b80b7da16a3ddc9cf524587df2b722c413a4ff3727724c648a')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Python2 fix
  for _file in setup.py gespeaker src/gespeaker.py
  do
    sed -i 's#env python#env python2#' "${_file}"
  done
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

