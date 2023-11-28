# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('xapp-thumbnailers-common'
         'xapp-mp3-thumbnailer'
         'xapp-epub-thumbnailer'
         'xapp-raw-thumbnailer'
         'xapp-vorbiscomment-thumbnailer'
         'xapp-appimage-thumbnailer')
pkgbase=xapp-thumbnailers
pkgver=1.2.3
pkgrel=1
pkgdesc="Thumbnailers for GTK Desktop Environments"
arch=('any')
url="https://github.com/linuxmint/xapp-thumbnailers"
license=('GPL3')
makedepends=('meson')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c3b0ba1da4a7279be64f452ae507516b06cc1644bba7b14d18049dfe0f50ea09')

build() {
  arch-meson "$pkgbase-$pkgver" build
  meson compile -C build
}

package_xapp-thumbnailers-common() {
  pkgdesc="Common files for XApp thumbnailers"
  depends=('python' 'python-pillow')

  meson install -C build --destdir "$pkgdir"

  rm -rf "$pkgdir"/usr/{bin,share}
}

package_xapp-mp3-thumbnailer() {
  pkgdesc="MP3 thumbnailer"
  depends=('python-eyed3' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-epub-thumbnailer() {
  pkgdesc="ePub thumbnailer"
  depends=('xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-raw-thumbnailer() {
  pkgdesc="RAW thumbnailer"
  depends=('dcraw' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-vorbiscomment-thumbnailer() {
  pkgdesc="VorbisComment thumbnailer"
  depends=('python-mutagen' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-appimage-thumbnailer() {
  pkgdesc="AppImage thumbnailer"
  depends=('python-pyelftools' 'squashfs-tools' 'xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}
