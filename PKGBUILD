# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=emoji-keyboard
pkgname=$_pkgname-bin
pkgver=4.0.0
pkgrel=6
pkgdesc='Virtual keyboard like emoji palette (binary release)'
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('MIT')
arch=('x86_64')
depends=('emoji-font' 'libayatana-appindicator' 'webkit2gtk' 'xdotool')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        "$url/raw/v$pkgver/src-tauri/icons/icon.png"
        "$url/raw/v$pkgver/app-icon.svg"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('bfc9c56bc3355dd5d2b5f44451eea8ec6b41f7c8afbe6370b38f18a80b083873'
            '438b330601ddf2540e164f2d9ea4f4da72a56d5947d84e98f07e1d3556aa8d73'
            '51a27f3ba4d6635ce12813264c2c3218e040b6db88678716500d25f5edd164f4'
            '3e2288c507c722a8644c37d1d7b76181b9dbca17c4c32d69813eebd721aa2f06')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
  _icdr=usr/share/icons/hicolor
  install -Dm644 icon.png "$pkgdir/$_icdr/512x512/apps/$_pkgname.png"
  install -Dm644 app-icon.svg "$pkgdir/$_icdr/scalable/$_pkgname.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  mv "$pkgdir/$_icdr/256x256@2" "$pkgdir/$_icdr/256x256"
# Fix directory permissions
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  chmod +x $pkgdir/usr/bin/$_pkgname
}
