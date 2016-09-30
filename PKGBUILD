# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-bin
pkgver=0.12.3
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
#source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/"$pkgver"dev/Brave.tar.bz2"
#source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/0.12.3dev-RC3/Brave.tar.bz2" # broken URI by design?
source=("$pkgname-$pkgver-RC3.tar.bz2::https://github-cloud.s3.amazonaws.com/releases/46891997/bbdb9b9c-85f9-11e6-8dcc-7a0ef19fffbe.bz2?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAISTNZFOVBIJMK3TQ%2F20160930%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20160930T130518Z&X-Amz-Expires=300&X-Amz-Signature=383d375d3aac414496517a821b7c1f3c4f566723cfa219f2b860fb753054f738&X-Amz-SignedHeaders=host&actor_id=78099&response-content-disposition=attachment%3B%20filename%3DBrave.tar.bz2&response-content-type=application%2Foctet-stream"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave.desktop")
options=(!strip)
sha384sums=('e8e22052d56c151ebe9cacad4e3518f89e447a13f401db13a8245a774070b83f1fe3db26a4a4a792668c92e2ed6df90b'
            'dd60b1f5ee6817784db42d9595e318b02d60a9eb4375546eced89de8e5eaa4c778f9110869c4d8e795e7f69d9c410568'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f')


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
