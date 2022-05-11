# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=imap_tools
pkgname=python-imap-tools
pkgver=0.55.0
pkgrel=1
pkgdesc="Work with email and mailbox by IMAP"
arch=('any')
url="https://github.com/ikvk/imap_tools"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ikvk/imap_tools/archive/v$pkgver.tar.gz")
sha256sums=('a8c55147527e981311fc69d97737644427c796ad73025bb83a31cd73e000bcd3')

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
