# Maintainer: Stephen Bell <theredbaron1834 {at} yahoo {dot} com>
pkgname=apk-thumbnailer
pkgver=1.0
pkgrel=1
pkgdesc="a simple thumbnailer for apk files"
arch=(i686 x86_64)
url="https://github.com/theredbaron1834/Scripts/blob/master/apk-thumbnailer"
license=('BSD 3 Clause')
depends=('java-runtime' 'android-sdk-build-tools' 'imagemagick' 'unzip')


prepare() {
  mkdir -p "$srcdir/opt/apk-thumbnailer/"
  mkdir -p "$srcdir/usr/share/thumbnailers/"
  cd "$srcdir"
  curl -L https://github.com/theredbaron1834/Scripts/raw/master/apk-thumbnailer -o "$srcdir"/opt/apk-thumbnailer/apk-thumbnailer

echo "[Thumbnailer Entry]
TryExec=/opt/apk-thumbnailer/apk-thumbnailer
Exec=/opt/apk-thumbnailer/apk-thumbnailer %u %o
MimeType=application/vnd.android.package-archive" > $srcdir/usr/share/thumbnailers/apk-thumbnailer.thumbnailer
}

package() {
  cd "$pkgdir"
  install -m755 -d "$pkgdir/opt/apk-thumbnailer"
  install -m755 -d "$pkgdir/usr/share/thumbnailers/"
  cp -r "$srcdir/opt" "$pkgdir/"
  cp -r "$srcdir/usr" "$pkgdir/"
  chmod +x "$pkgdir/opt/apk-thumbnailer/apk-thumbnailer"
}
