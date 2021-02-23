pkgname=masterpdfeditor-libs-included
pkgname_=masterpdfeditor
pkgver=5.6.80
pkgrel=1
pkgdesc='A complete solution for creation and editing PDF files (with libs and qt5 included)'
url='https://code-industry.net/free-pdf-editor/'
arch=('x86_64')
provides=('masterpdfeditor')
license=('custom')
makedepends=('patchelf')
depends=('gcc-libs' 'glibc' 'libgl' 'nspr' 'nss' 'sane')
source=("https://code-industry.net/public/master-pdf-editor-${pkgver}-qt5_included.x86_64.rpm")
sha256sums=('7d8a3a57538b1363eb934d4e2308289ab560f38b44f273634fa50cbed28ed571')

package() {
  install -d "$pkgdir"{/usr/bin/,/usr/share/}
  cp -a --no-preserve=ownership ${srcdir}/opt "$pkgdir/"
  cp -a --no-preserve=ownership ${srcdir}/usr/share/icons "$pkgdir/usr/share/"
  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"
  ln -sr ${pkgname_}${pkgver%%.*}.sh "$pkgdir/usr/bin/${pkgname_}${pkgver%%.*}"
  install -Dm644 ${srcdir}/usr/share/applications/masterpdfeditor5.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 ${srcdir}/opt/master-pdf-editor-5/license.txt -t "$pkgdir/usr/share/licenses/${pkgname_}${pkgver%%.*}/"
  patchelf --remove-rpath ${pkgname_}${pkgver%%.*}
}
