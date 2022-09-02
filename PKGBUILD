# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=0.1.0
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL2)
depends=(hicolor-icon-theme python-pyqt5)
makedepends=(qt5-tools)
groups=(pro-audio)
_patchbay_commit='17ee2760d36839042ab39ac4d43e2bb6ffd0702b'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Houston4444/$_name/archive/refs/tags/v$pkgver.tar.gz"
        "HoustonPatchbay-$_patchbay_commit.tar.gz::https://github.com/Houston4444/HoustonPatchbay/archive/$_patchbay_commit.tar.gz")
sha256sums=('3f6911198d1d7beb990aaf7b2fce989001e4d5c5d92bf2fe09b68f3c956d6734'
            'f73374c305cbd77d50dc09f14ead1d88b9cf3600241b240899ae4bf8bcfc0321')


prepare() {
  cd $_name-$pkgver
  rm -rf HoustonPatchbay && \
  ln -s "$srcdir"/HoustonPatchbay-$_patchbay_commit HoustonPatchbay
}

build() {
  cd $_name-$pkgver
  make
}

package() {
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
