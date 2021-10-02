# Maintainer: robertfoster
# Contributor: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.48
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="https://friture.org/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy' 'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'python-pip' 'python-setuptools' 'python-wheel')
_commit=ea7210dae883edf17de8fec82f9428b18ee138b6
#source=("https://github.com/tlecomte/friture/archive/v${pkgver}.tar.gz")
source=("https://github.com/tlecomte/${pkgname}/archive/${_commit}.tar.gz")

build() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${_commit}"

  python setup.py build
}

package() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${_commit}"

  python setup.py install --root="${pkgdir}/"

  install -Dm644 resources/images/friture.iconset/icon_512x512.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "appimage/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|usr|/usr|g" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

sha256sums=('c4b2a9db8cb460c19a94e754594ea1807d629ef8d20a00c5df0d422f3fb1961d')
