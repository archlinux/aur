# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin
pkgver=1.0.0.6
pkgrel=2
arch=('armv7h' 'i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('LicenseRef-EULA')
depends=('epsonscan2')
source_armv7h=("https://download3.ebz.epson.net/dsc/f/03/00/15/17/63/48960ec5ddbf40da95caaac2ed1ced296fdc2110/epsonscan2-bundle-6.7.63.0.armv7l.deb.tar.gz")
source_i686=("https://download3.ebz.epson.net/dsc/f/03/00/15/17/67/ceae6a02aaa81cb61012899987fbb5ab891b6ab2/epsonscan2-bundle-6.7.63.0.i686.deb.tar.gz")
source_x86_64=("https://download3.ebz.epson.net/dsc/f/03/00/15/17/68/050e5a55ed90f4efb4ca3bdd34e5797b149443ca/epsonscan2-bundle-6.7.63.0.x86_64.deb.tar.gz")
b2sums_armv7h=('c9de6f511bf91a311f0bc92a8feb1aa436aee9850aeb1312ef337eb7c1fa9ee3df71b61911df8fc8c195383df38a52e9baa57f17eb31ed6cabe4337a80fc5e1e')
b2sums_i686=('292a5f5022653c7a89e4439fde30cd2dcba498e58d7d06b30ceaedf898c016f0622f2eb1478c624b51036a10eac457a006aefe35b3e1e56e50b87058c22979a1')
b2sums_x86_64=('822bca019da25ae23840ab2f9886f08dcc7bc0fed5e1b4516c942269005a513710bf2718b2a39d0aba8000b052b28b84a987b27d29438f7f7c608b6374c176d9')

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
