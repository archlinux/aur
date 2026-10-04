# Maintainer: Chris Watson (watzon)
pkgname=sayso-bin
pkgver=0.4.3
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
sha256sums_x86_64=('a4da87bfdd7a9b650457a67b5bd6fa65665676f82ef2cb8b4453924f34bc9e5c')
sha256sums_aarch64=('a9fb7a86fc4c8622353d780ad187ca1786aae072c1856ff8b51860350fb17542')

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
