# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
# AUR: mdflowviewer-bin (GitHub Release'teki hazır .deb'i yeniden paketler)
pkgname=mdflowviewer-bin
_pkgname=mdflowviewer
pkgver=3.0.2
pkgrel=1
pkgdesc="Markdown viewer and editor with live preview (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cafercan/MDViewer"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'libsoup3' 'xdg-utils' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("${_pkgname}_${pkgver}_amd64.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('df96a83914477897e2b5d8ecbc8176155ff3c5ff09006d2627c33664d31f8418')

package() {
  bsdtar -xOf "${_pkgname}_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
  # Debian'ın copyright dosyası yerine Arch'ın lisans yolu
  install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "$pkgdir/usr/share/doc"
}
