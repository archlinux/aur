# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=imap_tools
pkgname=python-imap-tools
pkgver=1.6.0
pkgrel=2
pkgdesc="Work with email and mailbox by IMAP"
arch=('any')
url="https://github.com/ikvk/imap_tools"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ikvk/imap_tools/archive/v$pkgver.tar.gz")
sha256sums=('8439abe9446a328e2308d74b7f3bd30a1688d8e915250f9404a9b0993938d472')

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
