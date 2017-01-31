# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-bin
pkgver=0.13.0
pkgrel=2
pkgdesc="A web browser that stops ads and trackers by default. Binary release."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:several')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=('brave' 'brave-browser')
conflicts=('brave')
replaces=('brave-browser-bin')
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/"v$pkgver"dev/Brave.tar.bz2"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave"
        "brave.desktop")
options=(!strip)
sha512sums=('e6cd17443b1a1687617b543664abdc9f4eb7c637cbb7f89e5dfea72ad98b6eae6c4fbc6574d9363db28e9e566bb462573e803f67c1351d596cc25e706f76a05b'
            'f5d0a906dd91f5da6af88d8c31098a4fe0e38baf27e52c2e77ba8cf7a2d41ebddad5dbc543b14766fc2684ae27e7e2e5faf8cd9036dcde0a7d4b05943599ed41'
            'c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e'
            '15c8ddd91dc5da3b20b551593594c23248d4d7945d9635b4240ad23cf9cc605ce83ed3082e75c0376f6a15c5cf0796c0beb4c6721334b3759708a3063f89c47d'
            '337de1b406c89418fb27a49b1a9fa4cfef94eefbf2901bc60f5ddac0b9094924e940fcbcb233cbbeff2742e6b3c26cc6dbdb75cd29798eff8c8be92fce0df2e7')


package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  # Yes, btrfs, Thanks for asking. :-)
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave

  install -Dm0755 "$srcdir"/brave "$pkgdir"/usr/bin/brave

  install -Dm0644 "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 "$srcdir"/brave.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -Dm0664 "$srcdir"/MPL2 "$pkgdir"/usr/share/licenses/brave-git/MPL2

  mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-git/

  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree 
}
