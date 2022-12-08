# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=opensubtitlesdownload
_pkgname=OpenSubtitlesDownload
pkgver=5.0
pkgrel=1
arch=('any')
pkgdesc="An application to help you quickly find and download subtitles for your favorite videos"
url="https://emeric.io/OpenSubtitlesDownload"
license=('GPL3')
provides=('OpenSubtitlesDownload')
depends=('python' 'wget')
optdepends=(
    'zenity: only needed for GNOME based desktop environments'
    'kdialog: only needed for KDE based desktop environments'
)
source=("$_pkgname-$pkgver::https://github.com/emericg/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('a1f27ddedfeebbbadfb7456d31fa4d78')

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
