# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tidemail repository, not this file.

pkgname=tidemail-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Keyboard-first terminal email client with multi-account mail, a unified inbox, drafts, contacts, search, and optional AI tools"
arch=('x86_64' 'aarch64')
url="https://github.com/allisonhere/tidemail"
license=('MIT')
provides=("tidemail=$pkgver")
conflicts=('tidemail')
optdepends=(
  'xdg-utils: open links and attachments in a desktop application'
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative to xclip)'
  'libnotify: desktop notifications for new mail'
)
# Upstream ships a static, already-stripped binary; re-stripping it only
# produces an empty debug package.
options=('!strip' '!debug')

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "tidemail-$pkgver.png::$url/raw/v$pkgver/images/tidemail-icon.png"
        "tidemail-$pkgver.desktop::$url/raw/v$pkgver/packaging/linux/tidemail.desktop")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-aarch64.tar.gz")
sha256sums=('7ded3abde5f4be92306e0ee24c6db97b1825e4eaa1b8fd473669c521f5a409dd'
            'a2510a7a5185a520ea815f8c19799055a363e2cd9c98e7c9d8ce748a703db0b6'
            '65217068259c58ac622c1ceb73acf33c96eaa0f1905a936410ac7936853d2b44')
sha256sums_x86_64=('1ef73505d9244f7adfae55a28a4b2cd88df79c6a795921de60ec6d95f83ff395')
sha256sums_aarch64=('8234b3a8a17441c452f49112f46ce21e9b634f801f229b83a297a99897723b9a')

package() {
  install -Dm755 "$srcdir/tidemail-linux-$CARCH" "$pkgdir/usr/bin/tidemail"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tidemail-$pkgver.png" "$pkgdir/usr/share/pixmaps/tidemail.png"
  install -Dm644 "$srcdir/tidemail-$pkgver.desktop" "$pkgdir/usr/share/applications/tidemail.desktop"
  # The manual page is embedded in the binary, so it matches this release.
  # Releases that predate `tidemail man` simply ship without one.
  if "$srcdir/tidemail-linux-$CARCH" man > "$srcdir/tidemail.1" 2>/dev/null && [ -s "$srcdir/tidemail.1" ]; then
    install -Dm644 "$srcdir/tidemail.1" "$pkgdir/usr/share/man/man1/tidemail.1"
  fi
}
