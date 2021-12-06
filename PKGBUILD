# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Co-maintainer: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
_name="OpenCPN"
pkgver=5.6.0
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxgtk3' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme' 'webkit2gtk')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
install=opencpn.install
source=("https://github.com/${_name}/${_name}/archive/Release_${pkgver}.tar.gz")
sha1sums=('62b3ebdf373c76f00b7191a44e1b0576df872e55')

prepare() {
  cd "OpenCPN-Release_${pkgver}"
  export PATH="$PWD/bin:$PATH"
  mkdir -p  bin
  ln -sf /usr/bin/wx-config-gtk3 bin/wx-config
}

build() {
  cd "OpenCPN-Release_${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
        -DOCPN_FORCE_GTK3=ON
  make
}

package() {
  cd "OpenCPN-Release_${pkgver}"
  make DESTDIR="$pkgdir" install
}
