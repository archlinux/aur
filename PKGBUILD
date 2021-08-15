# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=avvie
_appname=Avvie
_appid=com.github.taiko2k.avvie
pkgver=1.7
_commit=dda3f9583bd22b21edbfbb2500402b9e3ca139f8
pkgrel=2
pkgdesc="A utility for quickly cropping images"
arch=(x86_64)
url=https://github.com/Taiko2k/Avvie
license=(GPL3)
depends=(gtk3
         libnotify
         python-cairo
         python-gobject
         python-piexif
         python-pillow)
makedepends=(git)
source=("git+$url.git#commit=$_commit"
        "$pkgname.sh")
sha512sums=('SKIP'
            'bca66e08dba2ef9c0e1ccfd3ecf8ff3125421b71a25d1a0aaa91030db0a5b6e19c3318bba2a5146b085c855f16a798ada55fbc78ebe5fcdb821eea67f15bc07a')

prepare() {
  cd "$srcdir/$_appname"
  sed -i "s,main.py,$pkgname," "$_appid.desktop"
}

package() {
  cd "$srcdir/$_appname"
  install -Dm644 main.py -t "$pkgdir/usr/lib/$pkgname"
  install -Dm644 "$_appid.appdata.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "$_appid.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_appid.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "$_appid-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 "icon128.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 "icon256.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
