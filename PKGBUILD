# Maintainer: kengzzzz <github.ezgew@spk4x.com>

pkgname=hypr-kblayoutd-bin
_pkgname=hypr-kblayoutd
pkgver=0.3.0
pkgrel=1
pkgdesc="Small Hyprland daemon that remembers keyboard layout per window (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/kengzzzz/hypr-kblayoutd"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# The release profile already sets strip = true.
options=('!strip' '!debug')

_url_base="$url/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_url_base/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_url_base/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('f07535e32126aa4cc41f6963fca4ac0df65e1c36908101cdb7eb93f99c36707f')
sha256sums_aarch64=('00b5e5552eb195d14e2c0563481e36c21d5797cbac806ab3c563c6b463af7ff0')

package() {
  cd "$_pkgname-$pkgver-$CARCH"

  install -Dm755 "$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 contrib/hypr-kblayoutd.service \
    "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 docs/benchmarks.md \
    "$pkgdir/usr/share/doc/$pkgname/benchmarks.md"

  install -Dm644 docs/validation.md \
    "$pkgdir/usr/share/doc/$pkgname/validation.md"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
