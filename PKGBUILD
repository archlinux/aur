# Maintainer: David Runge <dave@sleepmap.de>

pkgname=patroneo
pkgver=1.2
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/fluajho.git/"
license=('GPL3')
groups=('pro-audio')
depends=('hicolor-icon-theme' 'jack' 'non-session-manager' 'python-pyqt5'
'ttf-dejavu')
makedepends=('nuitka')
#optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('9a7e655aab84521b4e52547197f320979e05c8c9c618e0ce71d75c87bc0a9fed88e2633cfb3830ccb27c695dbc1cded1e014a31eb5891fc791cfd2a38b62c0f3'
            'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  # making sure, that the resulting binary doesn't have executable stack
  # this is a known problem with current nuitka:
  # https://www.freelists.org/post/nuitka-dev/Nuitka-compiles-with-executable-stack-which-is-a-security-risk
  export LDFLAGS+=",-z,noexecstack"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
