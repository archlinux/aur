# Maintainer: Patrick Goetz <pgoetz at mail dot utexas dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=masterpdfeditor
pkgver=5.9.99
pkgrel=1
pkgdesc='A complete solution for viewing, creating and editing PDF files'
url='https://code-industry.net/free-pdf-editor/'
arch=('x86_64')
license=('custom')
makedepends=('patchelf')
source_x86_64=("https://code-industry.net/public/master-pdf-editor-${pkgver}-qt6.x86_64.tar.gz")
sha1sums_x86_64=('bbb128f7f23594d11cabbb7865ea85510f0833db')

package() {
  depends=('libgl' 'pkcs11-helper' 'qt6-base' 'qt6-svg' 'qt6-declarative' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 usr/share/applications/net.code-industry.masterpdfeditor${pkgver%%.*}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 license_en.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  find usr/share/icons -type f -exec install -Dm644 "{}" "$pkgdir/{}" \;
  patchelf --remove-rpath masterpdfeditor${pkgver%%.*}
}

