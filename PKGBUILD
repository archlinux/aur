# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-bin
pkgver=0.12.5
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
#source=("$pkgname-0.12.1dev.tar.bz2::https://github.com/brave/browser-laptop/releases/download/0.12.1dev/Brave.tar.bz2"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave.desktop")
options=(!strip)
sha512sums=('be8ab66320bc9f62b7a5708f18ef46bf5c891c3d096bd87134755960da0826947762af51659e0e354af3e0ec70bc25652891087e5364624236c9876b0fe9f5e6'
            'a44504dd240fc35f0fb3196a704f8aa038f085c0f3fdac6bb8befa839d0ee429915b509afb5ab56854264d9cdffaf0e2a8e6df30a01553db5958cec9a162affa'
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
