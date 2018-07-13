# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=me-edit-bin
pkgver=20151007
pkgrel=1
pkgdesc="Patch editor for the Boss ME-25 guitar multi effects and Roland GR-20 guitar synthesizer."
arch=('any')
url="https://sourceforge.net/projects/me-edit/"
license=('GPL2')
depends=('libusb' 'jasper' 'libx11' 'fontconfig' 'harfbuzz' 'libmng' 'libwebp' 'libpng12')
makedepends=('patchelf')
provides=('me-edit')
conflicts=('me-edit')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://netix.dl.sourceforge.net/project/me-edit/ME-25-Edit/ME-25-Edit_linux-64.tar.gz"
	'me-edit')
sha256sums=('c10ef3ca9afae7327f39bdf9b29e2a91'
	    'f040d11f80d0a4ae38fa9a6a19114fba')

build() {
  patchelf --replace-needed libjasper.so.1 libjasper.so "$srcdir"/ME-25-Edit/ME-25-Edit
  patchelf --replace-needed libwebp.so.5 libwebp.so "$srcdir"/ME-25-Edit/ME-25-Edit
}

package() {
  install -dm 755 "$pkgdir"/usr/share/me-edit/init_patches/
  find "$srcdir/ME-25-Edit/init_patches/" -type f -exec install -m 744 "{}" "$pkgdir/usr/share/me-edit/init_patches/" \;

  install -dm 755 "$pkgdir"/usr/share/me-edit/saved_patches/
  find "$srcdir/ME-25-Edit/saved_patches/" -type f -exec install -m 744 "{}" "$pkgdir/usr/share/me-edit/saved_patches/" \;

  install -Dm 444 "$srcdir"/ME-25-Edit/license.txt "$pkgdir"/usr/share/me-edit/license.txt
  install -Dm 444 "$srcdir"/ME-25-Edit/readme.txt "$pkgdir"/usr/share/me-edit/readme.txt
  install -Dm 644 "$srcdir"/ME-25-Edit/ME-25EditorManual_E.doc "$pkgdir"/usr/share/me-edit/ME-25EditorManual_E.doc
  install -Dm 644 "$srcdir"/ME-25-Edit/ME-25EditorManual_E.pdf "$pkgdir"/usr/share/me-edit/ME-25EditorManual_E.pdf

  install -Dm 755 "$srcdir"/ME-25-Edit/ME-25-Edit "$pkgdir"/usr/share/me-edit/ME-25-Edit

  install -Dm 755 "$srcdir"/me-edit "$pkgdir"/usr/bin/me-edit
}
