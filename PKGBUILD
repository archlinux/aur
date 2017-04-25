# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.3.1
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'python-systemd: Logging to the system journal')
makedepends=('intltool')
source=(
  "https://github.com/pithos/pithos/releases/download/${pkgver}/pithos-${pkgver}.tar.xz"{,.asc}
)
sha256sums=('cf732bd5c541a55e160d58743e19c2beca69476fae6ead745f0ba6b08615d509'
            'SKIP')

validpgpkeys=('108BF2212A051F4A72B18448B3C7CE210DE76DFC')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  DESTDIR="$pkgdir" make install
}
