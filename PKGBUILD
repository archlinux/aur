# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=tirdad-dkms-git
_pkgname=tirdad
install=tirdad-dkms-git.install
pkgver=r57.62dc8cb
pkgrel=1
pkgdesc="Tirdad kernel module for random ISN generation"
arch=('any')
url='https://github.com/0xsirus/tirdad'
license=('GPL3')
depends=('dkms')
makedepends=('git')
source=("tirdad::git+https://github.com/0xsirus/tirdad.git#branch=master"
"dkms.conf")
sha256sums=('SKIP'
            '23928bbd67a46f9a418b545729d8549d4ce1e8a02723b86891e5b7deb5b60750')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  srcdir_pkg="$pkgdir/usr/src/${_pkgname}-${pkgver}"

  install -dm755 "$srcdir_pkg"

  cp -a "$srcdir/$_pkgname/." "$srcdir_pkg/"

  sed -e "s/@_pkgname@/${_pkgname}/g"\
      -e "s/@pkgver@/${pkgver}/g" dkms.conf > $srcdir_pkg/dkms.conf

  install -Dm644 "$srcdir/$_pkgname/COPYING" \
          "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
