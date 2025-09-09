# Maintainer: robertfoster
# Contributor: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.53 # renovate: datasource=github-tags depName=tlecomte/friture
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="https://friture.org/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy'
  'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer'
  'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=(
  "https://github.com/tlecomte/friture/archive/refs/tags/v${pkgver}.tar.gz"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation -x
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 resources/images/friture.iconset/icon_512x512.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "appimage/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|usr|/usr|g" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

sha256sums=('3015472c870285d432fe5b194f649b7b88fd0bea1fa60c6b308fad50118b211d')
