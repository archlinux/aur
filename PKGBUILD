# Maintainer: Please see AUR package page for current maintainer(s) and contact information.
pkgname=brave-browser-bin
pkgver=0.7.16
pkgrel=1
pkgdesc="A chromium-based web browser that stops ads and trackers by Brendan Eich and Co. Binary release."
arch=('x86_64') # No 32-bit builds for you!
url="https://www.brave.com/"
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'expat' 'libxtst' 'desktop-file-utils')
optdepends=('cups: To use your printer.')
provides=('brave')
conflicts=('brave')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v"$pkgver"dev/Brave-Linux-x64.tar.bz2"
        "https://github.com/brave/browser-laptop/raw/master/res/app.png")
options=(!strip)
md5sums=('0df5df8af5aafc1939b348a067832bd3'
         'c4bf8ad589466484457acb617b89719c')


package() {

  install -d -m0755 "$pkgdir"/opt

  cp -a --reflink=auto "$srcdir"/Brave-linux-x64 "$pkgdir"/opt/$pkgname

  install -d -m0755 "${pkgdir}/usr/bin"

  ln -s "/opt/$pkgname/Brave" "${pkgdir}/usr/bin/brave-browser-bin"

  install -D -m0644 "$startdir"/brave-browser-bin.desktop "$pkgdir"/usr/share/applications/brave-browser-bin.desktop

  install -D -m0644 "$startdir"/app.png "$pkgdir"/usr/share/pixmaps/brave-browser-bin.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  mv "$pkgdir"/opt/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname

}
