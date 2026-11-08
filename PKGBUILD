# Maintainer: Swastik Patel <ping at cptdawn dot dev>
#
# Source of truth: packaging/aur/ in https://github.com/CPT-Dawn/Hoarder.
# The release workflow fills in pkgver and the checksums (packaging/aur/render.sh).

pkgname=hoarder-bin
_pkgname=hoarder
pkgver=1.0.0
pkgrel=1
pkgdesc='Pixel-exact screenshots and a clipboard that outlives the app that set it, for Wayland (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/CPT-Dawn/Hoarder'
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon')
optdepends=('xdg-utils: open a Capture from its notification'
            'hoarder-wl-compat: wl-copy and wl-paste served by Hoarder')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# The release binary is already stripped.
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('db7796370408fbbbef555f344d4def6fc4505f6a6b7a90e3e6c2a6851d85f3fc')
sha256sums_aarch64=('10b6420724edb524495fbcaf08e2429af169f8ed6647db626f7bb643dec615e1')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 hoarder -t "$pkgdir/usr/bin"
  install -Dm644 systemd/hoarder.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 completions/hoarder.bash "$pkgdir/usr/share/bash-completion/completions/hoarder"
  install -Dm644 completions/_hoarder -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/hoarder.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 config.toml README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
