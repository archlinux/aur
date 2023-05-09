# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('xapp-thumbnailers-common'
         'xapp-mp3-thumbnailer'
         'xapp-epub-thumbnailer'
         'xapp-raw-thumbnailer'
         'xapp-appimage-thumbnailer')
pkgbase=xapp-thumbnailers
pkgver=1.0.1
pkgrel=2
pkgdesc="Thumbnailers for GTK Desktop Environments"
arch=('any')
url="https://github.com/linuxmint/xapp-thumbnailers"
license=('GPL3')
makedepends=('python')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5c7971edafd07e17b3961c3dbd0993e2511feb5db0c42c90332ff393100d2213')

package_xapp-thumbnailers-common() {
  pkgdesc="Common files for XApp thumbnailers"
  depends=('python' 'python-pillow')

  cd "$pkgbase-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 usr/lib/python3/dist-packages/XappThumbnailers/__init__.py -t \
    "${pkgdir}${site_packages}/XappThumbnailers/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_xapp-mp3-thumbnailer() {
  pkgdesc="MP3 thumbnailer"
  depends=('python-eyed3' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-epub-thumbnailer() {
  pkgdesc="ePub thumbnailer"
  depends=('xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-raw-thumbnailer() {
  pkgdesc="RAW thumbnailer"
  depends=('dcraw' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-appimage-thumbnailer() {
  pkgdesc="AppImage thumbnailer"
  depends=('python-pyelftools' 'squashfs-tools' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}
