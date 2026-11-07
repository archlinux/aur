# Maintainer: smiley <smiley@archlinux.org>

pkgname=hyprlogin-bin
_pkgname=hyprlogin
pkgver=0.4.0
pkgrel=2
pkgdesc='GPU-accelerated greetd greeter for Hyprland, forked from hyprlock (prebuilt)'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/hyprlogin'
license=('BSD-3-Clause')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# The binary is linked against these sonames; pacman blocks an upgrade that
# bumps one until this package is rebuilt.
depends=(
  'cairo'
  'glibc'
  'greetd'
  'libegl'
  'libgcc'
  'libgles'
  'libhyprgraphics.so=5-64'
  'libhyprlang.so=2-64'
  'libhyprutils.so=13-64'
  'libstdc++'
  'libxkbcommon'
  'wayland'
)
optdepends=(
  'hyprland: greeter compositor session'
)
backup=('etc/hyprlogin/hyprlogin.conf')
options=(!debug !strip)
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/AuthenticSm1les/hyprlogin/v$pkgver/LICENSE")
noextract=("$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('2ee1737f6aa95963c5bf5f6b90b64e7d1221ee379f1c5d0ecae824c16d26456d'
            '52d07f3457591b4496ae2e79b05efd63c7df72135666fa12428d83078c4c0de5')

package() {
  bsdtar -xf "$_pkgname-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/usr/share/hyprlogin/examples/hyprlogin.conf" "$pkgdir/etc/hyprlogin/hyprlogin.conf"
}
