# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.6.0
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
depends=(libxml2 libzip)
license=('BSD')
conflicts=('scim-spreadsheet')
source=("https://github.com/andmarti1424/$pkgname/archive/v${pkgver}.tar.gz"
        'arch.patch')
sha256sums=('5da644d380ab3752de283b83cce18c3ba12b068d0762c44193c34367a0dcbc38'
            '76bbe0e1e96e2623b8304f267f7cf310ee2f82e222c57a318d0e3434963203ba')
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
