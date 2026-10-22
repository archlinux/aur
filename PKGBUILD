# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=padtune-bin
_pkgname=padtune
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial configurator for BIGBIG WON controllers (Rainbow 2 Pro and family): buttons, sticks, triggers, lights, macros, polling rate (prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/padtune"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs' 'libglvnd' 'libxkbcommon')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('c2433d0d0d9deb2c357ff7776fbff7536d7ed3238e17050645927ab553f52722')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 padtune padtune-gui -t "$pkgdir/usr/bin/"
  install -Dm644 padtune.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 70-padtune.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/padtune.png"
  done
  install -Dm644 icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/padtune.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
