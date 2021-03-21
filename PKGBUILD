# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-opensubtitlesdownload
_pkgname=OpenSubtitlesDownload
pkgver=4.1
pkgrel=2
arch=('any')
pkgdesc="Python nautilus-compatible script to download subtitles form opensubtitles.org"
url="https://emeric.io/OpenSubtitlesDownload"
license=('GPL3')
provides=('OpenSubtitlesDownload')
depends=('python' 'wget')
optdepends=(
    'zenity: only needed for GNOME based desktop environments'
    'kdialog: only needed for KDE based desktop environments'
)
source=("$_pkgname-$pkgver::https://github.com/emericg/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('ada08ad3bd6e0fc18212bb98ee6e5d4f')

prepare() {
  sed 's/"%F"/%F/' -i "$_pkgname-$pkgver/desktop-files/$_pkgname-gnome.desktop"
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "${_pkgname}.py" "$pkgdir/usr/bin/$_pkgname"
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 "desktop-files/$_pkgname-gnome.desktop" "$pkgdir/usr/share/applications/"
  install -Dm644 "desktop-files/$_pkgname-kde.desktop" "$pkgdir/usr/share/applications/"
}
