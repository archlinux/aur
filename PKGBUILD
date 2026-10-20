# Maintainer: kengzzzz <github.ezgew@spk4x.com>

pkgname=hypr-kblayoutd-bin
_pkgname=hypr-kblayoutd
pkgver=0.4.0
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
sha256sums_x86_64=('a5fcb6b1ce0fbfd5d9927d6d833aa19efa09fbe04b37a8eb226e92ac51bac246')
sha256sums_aarch64=('6aa9f208acf760be57682f8dc3878aa19c2c7f5ac6e993d03fe3af3008e948db')

package() {
  cd "$_pkgname-$pkgver-$CARCH"

  install -Dm755 "$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 contrib/hypr-kblayoutd.service \
    "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 CHANGELOG.md \
    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 docs/benchmarks.md \
    "$pkgdir/usr/share/doc/$pkgname/benchmarks.md"

  install -Dm644 docs/validation.md \
    "$pkgdir/usr/share/doc/$pkgname/validation.md"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
