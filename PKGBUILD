# Maintainer: robertfoster

pkgname=friture-git
pkgver=v0.49.r1.ge12cd9a
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="https://friture.org/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy' 'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'git' 'python-pip' 'python-setuptools' 'python-wheel')
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/tlecomte/friture.git")

build() {
  cd ${pkgname%-git}
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  python setup.py install --root="${pkgdir}/"

  install -Dm644 resources/images/friture.iconset/icon_512x512.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "appimage/${pkgname%-git}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  sed -i "s|usr|/usr|g" \
    "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}

pkgver() {
  cd friture
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')
