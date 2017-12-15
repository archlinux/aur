# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.7.0
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
depends=(libxml2 libzip)
optdepends=('libxlsxwriter: export to xlsx. Requires rebuild of sc-im')
license=('BSD')
conflicts=('scim-spreadsheet' 'sc-im-git')
source=("https://github.com/andmarti1424/$pkgname/archive/v${pkgver}.tar.gz"
        'arch.patch')
sha256sums=('87225918cb6f52bbc068ee6b12eaf176c7c55ba9739b29ca08cb9b6699141cad'
            '1fcd263a13224fe2c18991852d31c2cc264c7d627578cbae348a9291dd38dede')
MAKEFLAGS='-j1'

prepare() {
  cd "$pkgname-$pkgver/src"
  # install things in the correct place for package managers
  patch <../../../arch.patch
}

build() {
  cd "$pkgname-$pkgver/src"
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
