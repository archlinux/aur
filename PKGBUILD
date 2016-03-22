# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=brave-browser-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A chromium and nodejs-based web browser that stops ads and trackers. Binary release."
arch=('x86_64') # No 32-bit builds for you! (Upstream only supports 64bit intel/amd).
url="https://www.brave.com/"
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'expat' 'libxtst' 'desktop-file-utils')
optdepends=('cups: To use your printer.')
provides=('brave')
conflicts=('brave')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v"$pkgver"dev/Brave-Linux-x64.tar.bz2"
        "https://github.com/brave/browser-laptop/raw/master/res/app.png"
        'brave-browser-bin.desktop'
        'launcher.sh')
options=(!strip)
sha384sums=('48638a7373219e9c27681872c7a3ae348b5415c3e5b9bc5db1e561a7bd0803d7ae9b79965193d6165dbf108c7625a832'
            '850b39853a44cb86fca09c82a201ad9ac8d4c6938c82ad1cfffcb40a9b2868a15ebc80a1c7d7597e9dfedf0144584381'
            'b69f0aa7334d0406eee4fb57705057a7d81852e47982bcbd427cb308e15ff1fb87a5b3b9ab544bd402d47b50ed87e934'
            '5297c00bad54eedd71fbb0a25ab13eb60fefdf42e093fd07b808e6aee598a1873626157c421dc7429e6367d7d3894614')


package() {

  install -d -m0755 "$pkgdir"/opt

  cp -a --reflink=auto "$srcdir"/Brave-linux-x64 "$pkgdir"/opt/$pkgname

  install -d -m0755 "$pkgdir"/usr/bin

  install -D -m0755 "$startdir"/launcher.sh "$pkgdir"/usr/bin/brave-browser-bin

  install -D -m0644 "$startdir"/brave-browser-bin.desktop "$pkgdir"/usr/share/applications/brave-browser-bin.desktop

  install -D -m0644 "$startdir"/app.png "$pkgdir"/usr/share/pixmaps/brave-browser-bin.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  mv "$pkgdir"/opt/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname

}
