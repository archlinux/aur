# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin
pkgver=1.0.0.6
pkgrel=1
_epsonscan2_ver=6.7.42.0
arch=('i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('custom')
depends=('epsonscan2')
replaces=('epsonscan2-non-free-plugin-bin')
source_i686=("https://download2.ebz.epson.net/epsonscan2/common/deb/x86/epsonscan2-bundle-${_epsonscan2_ver}.i686.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/epsonscan2/common/deb/x64/epsonscan2-bundle-${_epsonscan2_ver}.x86_64.deb.tar.gz")
sha512sums_i686=('0725b243bc6007934df1a9355cc1aa3198aa63aced18c4dc935a5e6b4d417c2c156fddb997cde1647d2ef9049b88d5094e3f1a76022314a9d6513c84707da27e')
sha512sums_x86_64=('88b6aecbf45dec7a10bce95e611f57f9f7d0d39dd069729d709028ad269d1efc1d421831563544d7f44455aa3240d05e71c5be12cd5d90c65af87e7c418aadaf')

prepare() {
  cd epsonscan2-bundle-${_epsonscan2_ver}*/plugins
  ar x epsonscan2-non-free-plugin*.deb
  tar -xJf data.tar.xz -C "$srcdir"
}

package() {
  install -d "$pkgdir/usr/lib/"
  cd "$srcdir/usr"
  mv lib/*/epsonscan2* "$pkgdir/usr/lib"
  mv libexec/epsonscan2-ocr/ocr-engine-getrotate "$pkgdir/usr/lib/epsonscan2-ocr"
  mv share "$pkgdir/usr"
  install -Dm644 "$pkgdir/usr/share/doc/$pkgname-$pkgver-1/copyright" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
