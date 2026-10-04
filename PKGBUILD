# Maintainer: Chris Watson (watzon)
pkgname=sayso-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Local voice dictation into any app"
arch=('x86_64' 'aarch64')
url="https://justsayso.app"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'freetype2' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: global shortcuts and the paste key on Wayland'
            'libglvnd: OpenGL when Vulkan is not available'
            'xdg-utils: open links and folders')
provides=('sayso')
conflicts=('sayso')
options=('!strip' '!debug')
source_x86_64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('ae8231cc9555978f54ebf2098547a7780577d772bec7bbecbb633692b91c8ee0')
sha256sums_aarch64=('ecb95ce19fa8f548387b2eaaa842e96097e4d3362783041540a602cfd33f9725')

package() {
  cd "sayso-$pkgver-linux-$CARCH"
  # The app finds the engine next to itself, so both binaries live in one folder.
  install -Dm755 bin/sayso "$pkgdir/usr/lib/sayso/sayso"
  install -Dm755 bin/sayso-engine "$pkgdir/usr/lib/sayso/sayso-engine"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/sayso/sayso "$pkgdir/usr/bin/sayso"
  install -Dm644 share/applications/dev.sayso.Sayso.desktop "$pkgdir/usr/share/applications/dev.sayso.Sayso.desktop"
  install -Dm644 share/metainfo/dev.sayso.Sayso.metainfo.xml "$pkgdir/usr/share/metainfo/dev.sayso.Sayso.metainfo.xml"
  cp -r share/icons "$pkgdir/usr/share/"
  install -Dm644 lib/udev/rules.d/70-sayso-uinput.rules "$pkgdir/usr/lib/udev/rules.d/70-sayso-uinput.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
