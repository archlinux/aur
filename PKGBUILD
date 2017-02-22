# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-bin
pkgver=0.13.4
pkgrel=3
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
sha512sums=('671b33eeba64559d97141e14c42ff217a499f4423369a00e15d8d87223102bcd338d91a2e73669dcf89940aa90fc8fd310e103ccd867402dfd2f87e3a4db8aea'
            'f5d0a906dd91f5da6af88d8c31098a4fe0e38baf27e52c2e77ba8cf7a2d41ebddad5dbc543b14766fc2684ae27e7e2e5faf8cd9036dcde0a7d4b05943599ed41'
            'c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e'
            '4302366877e5d7c3862c9223db4afd58e4323f1c0f763e4ecc2d648945972bbc5fe64752de415ea3b6a07a28df3cf4149d4e98e8604e3d1496ffaa3c9d9f203d'
            '337de1b406c89418fb27a49b1a9fa4cfef94eefbf2901bc60f5ddac0b9094924e940fcbcb233cbbeff2742e6b3c26cc6dbdb75cd29798eff8c8be92fce0df2e7')


package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  # Yes, btrfs, Thanks for asking. :-)
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave

  install -Dm0755 "$srcdir"/brave "$pkgdir"/usr/bin/brave

  install -Dm0644 "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 "$srcdir"/brave.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -Dm0664 "$srcdir"/MPL2 "$pkgdir"/usr/share/licenses/brave-bin/MPL2

  mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-bin/

  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree 
}
