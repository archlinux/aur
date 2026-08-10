# Maintainer: kengzzzz <github.ezgew@spk4x.com>

pkgname=hypr-kblayoutd-bin
_pkgname=hypr-kblayoutd
pkgver=0.3.1
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
sha256sums_x86_64=('688296712f97955d741ac31d2efbb198fa6acbf1c6d4fdfe0ec95708fd802cea')
sha256sums_aarch64=('db744e15373ca5a199ff429241225ca0c2c254e26187730ccefe21b977c7e422')

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
