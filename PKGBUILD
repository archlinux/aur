# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=imap_tools
pkgname=python-imap-tools
pkgver=0.39.0
pkgrel=1
pkgdesc="Work with email and mailbox by IMAP"
arch=('any')
url="https://github.com/ikvk/imap_tools"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ikvk/imap_tools/archive/v$pkgver.tar.gz")
sha512sums=('2c0226c73c50969acac0dde6559eb400cc3c8c43b854b9c4932824fafd01d67569ee75cd1fe566492f241ccafaf0e89c362554ce6448ac73954df89b95d87d16')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
