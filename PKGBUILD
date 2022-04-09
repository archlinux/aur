# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=avvie
_appname=Avvie
_appid=com.github.taiko2k.avvie
pkgver=2.0
_commit=6326118d4b768161d543cbf579b043cfada8b725
pkgrel=3
pkgdesc="A utility for quickly cropping images"
arch=(x86_64)
url=https://github.com/Taiko2k/Avvie
license=(GPL3)
depends=(gtk4
         libadwaita
         libnotify
         python-cairo
         python-gobject
         python-piexif
         python-pillow)
makedepends=(git)
source=("git+$url.git#commit=$_commit"
        "$pkgname.sh")
sha512sums=('SKIP'
            'f86abc0dd320938402e4b4c46e8dab4ff04b66882275d5fed8f37ad5dc08f6be4b734371282b31db96372767aca6e3f65d0513cd78a913833124a35e09406095')

prepare() {
  cd "$srcdir/$_appname"
  sed -i "s,main.py,$pkgname," "$_appid.desktop"
}

package() {
  cd "$srcdir/$_appname"
  install -Dm644 main.py -t "$pkgdir/usr/lib/$pkgname"
  install -Dm644 image-crop.svg -t "$pkgdir/usr/lib/$pkgname"
  install -Dm644 pinku.css -t "$pkgdir/usr/lib/$pkgname"

  install -Dm644 "$_appid.appdata.xml" -t "$pkgdir/usr/share/metainfo"
  install -Dm644 "$_appid.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_appid.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "$_appid-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 icon128.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 icon256.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
