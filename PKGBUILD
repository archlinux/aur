# Maintainer: spaciousejar <spaciousejar@users.noreply.github.com>
# Contributor: TechyCSR <info@techycsr.dev>

pkgname=opencluely-bin
pkgver=1.8.7
pkgrel=1
pkgdesc="Invisible AI interview copilot - stealth overlay that screen sharing cannot see"
arch=('x86_64')
url="https://opencluely.techycsr.dev"
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'libpulse' 'alsa-lib')
optdepends=('python-whisper: local speech recognition'
            'ffmpeg: audio conversion for transcription')
options=('!debug')
source=("opencluely_${pkgver}_amd64.deb::https://github.com/TechyCSR/OpenCluely/releases/download/v${pkgver}/opencluely_${pkgver}_amd64.deb")
sha256sums=('9b013c95a7f8a58aeb7fb1ba72a05ba89d0c520ec56c202ffb2a28d141e003ca')

package() {
  # The upstream .deb is an electron-builder bundle: unpack its data.tar.xz as-is.
  bsdtar -xOf "$srcdir/opencluely_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"

  chmod 4755 "$pkgdir/opt/OpenCluely/chrome-sandbox"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/OpenCluely/opencluely "$pkgdir/usr/bin/opencluely"
}