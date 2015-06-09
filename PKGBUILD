# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gespeaker-git
pkgver=0.8.2.4.g236462d
pkgrel=2
pkgdesc="A GTK+ frontend for espeak and mbrola to speech the read text."
url="http://www.muflone.com/gespeaker/"
arch=('any')
license=('GPL2')
depends=('espeak' 'librsvg' 'pygtk' 'python2-dbus' 'python2-xdg' 'alsa-utils')
makedepends=('git')
optdepends=('mbrola: for enhanced mbrola voices support'
            'mbrola-voices: at least one mbrola voice'
            'libpulse: PulseAudio output')
provides=('gespeaker')
conflicts=('gespeaker')
source=('git+https://github.com/muflone/gespeaker.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${pkgname%-*}"
  # Python2 fix
  for _file in setup.py gespeaker src/gespeaker.py
  do
    sed -i 's#env python#env python2#' "${_file}"
  done
}

build() {
  cd "${pkgname%-*}"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

