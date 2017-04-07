# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.3.0
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo' 'python>=3.6'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support')
makedepends=('intltool')
source=(
  "https://github.com/pithos/pithos/releases/download/${pkgver}/pithos-${pkgver}.tar.xz"{,.asc}
  'fix-python36.patch::https://github.com/pithos/pithos/commit/be9e8cb35692ef0b7d835dc26b28996cf6aacb7b.patch'
)
sha256sums=('9ff5ae0aac3265cd8ba91d07f42ec0819d6909d9607e4f6c10188ff3645134a9'
            'SKIP'
            'e39a4d5ff114dcb30ffef5b927b757a09d025d73025d8c5d9043a7b9baa1ef07')

validpgpkeys=('108BF2212A051F4A72B18448B3C7CE210DE76DFC')

prepare() {
  cd "$srcdir/${pkgname}-$pkgver"
  patch -Np1 -i "$srcdir/fix-python36.patch"
}

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  DESTDIR="$pkgdir" make install
}
