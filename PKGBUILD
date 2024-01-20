# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=googledot-cursor-theme
pkgver=2.0.0
pkgrel=1
pkgdesc="Cursor theme inspired on Google"
arch=('any')
url="https://github.com/ful1e5/Google_Cursor"
license=('GPL-3.0-or-later')
makedepends=('python-clickgen>2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e681d9c42e7ec1322953f4c4e1874f9d289c32e07893321dd44a0aa8c3be1f0')

prepare() {
  cd Google_Cursor-$pkgver
  rm -rf themes
}

build() {
  cd Google_Cursor-$pkgver

  declare -A names
  names["GoogleDot-Blue"]="Blue cursor theme inspired on Google"
  names["GoogleDot-Black"]="Black cursor theme inspired on Google"
  names["GoogleDot-White"]="White cursor theme inspired on Google"
  names["GoogleDot-Red"]="Red cursor theme inspired on Google"

  for key in "${!names[@]}"; do
    comment="${names[$key]}";
    ctgen build.toml -p x11 -d "bitmaps/$key" -n "$key" -c "$comment" &
    PID=$!
    wait $PID
  done
}

package() {
  cd Google_Cursor-$pkgver
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/GoogleDot-* "$pkgdir/usr/share/icons/"
}
