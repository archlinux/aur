# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-bin
pkgver=0.12.9
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Binary release."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:several')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support')
provides=('brave' 'brave-browser')
conflicts=('brave')
replaces=('brave-browser-bin')
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/"v$pkgver"dev/Brave.tar.bz2"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave.desktop")
options=(!strip)
sha512sums=('c4092945a0370cb4b9aa147f850a6830db2e9a8755b87d0081967343ac57fe72b530e17908540420c4c36fd59c39c456bb8d20953c4f52633da37b85471b8784'
            'f5d0a906dd91f5da6af88d8c31098a4fe0e38baf27e52c2e77ba8cf7a2d41ebddad5dbc543b14766fc2684ae27e7e2e5faf8cd9036dcde0a7d4b05943599ed41'
            'c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e'
            '337de1b406c89418fb27a49b1a9fa4cfef94eefbf2901bc60f5ddac0b9094924e940fcbcb233cbbeff2742e6b3c26cc6dbdb75cd29798eff8c8be92fce0df2e7')


package() {
  install -d -m0755 "$pkgdir"/usr/lib

  cp -a --reflink=auto "$srcdir"/Brave-linux-x64 "$pkgdir"/usr/lib/brave

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /usr/lib/brave/brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$startdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -dm0755 "$pkgdir"/usr/share/pixmaps

  cp --reflink=auto "$srcdir"/brave.png "$pkgdir"/usr/share/pixmaps/

  install -d -m0755 "$pkgdir"/usr/share/licenses/brave-bin

  cp --reflink=auto "$srcdir"/MPL2 "$pkgdir"/usr/share/licenses/brave-bin/MPL2

  mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-bin
}
