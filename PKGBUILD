# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-browser-bin
pkgver=0.8.3
pkgrel=2
pkgdesc="A web browser that stops ads and trackers by default. Binary release."
arch=('x86_64') # No 32-bit builds for you! (Joke appart, upstream supports x86_64 only).
url="https://www.brave.com/"
license=('custom:several')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'libgnome-keyring' 'libxtst' 'desktop-file-utils' 'ttf-font')
optdepends=('cups:                Printer support')
provides=('brave' 'brave-browser')
conflicts=('brave')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v"$pkgver"dev/Brave-Linux-x64.tar.bz2"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave.desktop")
options=(!strip)
sha384sums=('8cc316249adb07c4b11a7d240b834d656d414de06ee5101eb6fab4ea079aec559b74b959647bc4b224cedf7b21656c77'
            '850b39853a44cb86fca09c82a201ad9ac8d4c6938c82ad1cfffcb40a9b2868a15ebc80a1c7d7597e9dfedf0144584381'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f')


package() {
  install -d -m0755 "$pkgdir"/usr/lib

  cp -a --reflink=auto "$srcdir"/Brave-linux-x64 "$pkgdir"/usr/lib/brave-browser

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /usr/lib/brave-browser/brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$startdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -dm0755 "$pkgdir"/usr/share/pixmaps

  cp --reflink=auto "$srcdir"/brave.png "$pkgdir"/usr/share/pixmaps/

  install -d -m0755 "$pkgdir"/usr/share/licenses/brave-browser

  cp --reflink=auto "$srcdir"/MPL2 "$pkgdir"/usr/share/licenses/brave-browser/MPL2

  mv "$pkgdir"/usr/lib/brave-browser/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-browser
}
