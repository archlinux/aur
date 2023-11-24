# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=imap_tools
pkgname=python-imap-tools
pkgver=1.5.0
pkgrel=2
pkgdesc="Work with email and mailbox by IMAP"
arch=('any')
url="https://github.com/ikvk/imap_tools"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ikvk/imap_tools/archive/v$pkgver.tar.gz")
sha256sums=('35542a5e275f7be60c337f208cedfdfa132c7f3cd663ecc774aed312af266958')

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
