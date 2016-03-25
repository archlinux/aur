# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-browser-bin
pkgver=0.8.2
pkgrel=3
pkgdesc="A chromium and nodejs-based web browser that stops ads and trackers. Binary release."
arch=('x86_64') # No 32-bit builds for you! (Upstream only supports 64bit intel/amd).
url="https://www.brave.com/"
license=('custom:several')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'expat' 'libxtst' 'desktop-file-utils')
optdepends=('cups: To use your printer.')
provides=('brave')
conflicts=('brave')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v"$pkgver"dev/Brave-Linux-x64.tar.bz2"
        "brave.png::https://github.com/brave/browser-laptop/raw/master/res/app.png"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "brave.desktop")
#options=(!strip)
sha384sums=('48638a7373219e9c27681872c7a3ae348b5415c3e5b9bc5db1e561a7bd0803d7ae9b79965193d6165dbf108c7625a832'
            '850b39853a44cb86fca09c82a201ad9ac8d4c6938c82ad1cfffcb40a9b2868a15ebc80a1c7d7597e9dfedf0144584381'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            '43d5244a193bb093972c070fbc8f79cc59a3b46a034cb028edd2f645437633fd91226c6c36b713d1f387fbc377714f9d')


package() {
  install -d -m0755 "$pkgdir"/opt

  cp -a --reflink=auto "$srcdir"/Brave-linux-x64 "$pkgdir"/opt/$pkgname

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /opt/$pkgname/Brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$startdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -dm0755 "$pkgdir"/usr/share/pixmaps

  cp --reflink=auto "$srcdir"/brave.png "$pkgdir"/usr/share/pixmaps/

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  cp --reflink=auto "$srcdir"/MPL2 "$pkgdir"/usr/share/licenses/$pkgname/MPL2

  mv "$pkgdir"/opt/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname
}
