# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=pebrel-bin
pkgver=2.6.1
pkgrel=1
pkgdesc='GPU-accelerated terminal emulator with SSH and AI CLI integration (Linux Preview)'
arch=('x86_64')
url='https://github.com/Kuddev/pebrel'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libglvnd' 'vulkan-icd-loader' 'vulkan-driver' 'dbus'
         'hicolor-icon-theme' 'xdg-utils')
optdepends=('libsecret: save SSH credentials via secret-tool and a Secret Service provider'
            'xdg-desktop-portal: Wayland global shortcuts and desktop dialogs')
provides=("pebrel=$pkgver")
conflicts=('pebrel')
options=('!strip')
source=("$url/releases/download/v$pkgver/Pebrel-v$pkgver-linux-x64-preview.deb")
noextract=("${source[0]##*/}")
sha256sums=('ea011973273a954468c74fa793010223d86d1b7243ce874ba25515aa445d2a09')

package() {
  bsdtar -xOf "${noextract[0]}" data.tar.zst | bsdtar -xf - -C "$pkgdir"
  install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/zsh/site-functions"
  mv "$pkgdir/usr/share/doc/pebrel/licenses" "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/zsh/vendor-completions/_pebrel" "$pkgdir/usr/share/zsh/site-functions/"
  rmdir "$pkgdir/usr/share/zsh/vendor-completions"
}
