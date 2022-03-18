# Maintainer: Vincent B. <vb AT luminar.eu.org>
pkgname=klong
pkgver=20220315
pkgrel=1
pkgdesc="A simple array language"
arch=('armv7h' 'aarch64' 'x86_64')
url="http://t3x.org/klong"
license=("CC0")
source=("http://t3x.org/klong/klong${pkgver}.tgz"
        "vplot.patch")
sha256sums=('018b75ca2b2ee86eabc9ac3b6c14b0a2aa9200998d4d860e04432fdc80285191'
            '60be54e072864940c728d1d792b97590886358ecf5fb8f2751f6ce2d36e5e8c5')

prepare() {
  cd ${srcdir}/${pkgname}
  patch -p0 < ../../vplot.patch
  chmod a+r ${srcdir}/${pkgname}/lib/huffman.kg
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

check() {
  cd ${srcdir}/${pkgname}
  KLONGPATH=. make test
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib} ${pkgdir}/etc/profile.d
  cp ${srcdir}/${pkgname}/{kg,kplot} ${pkgdir}/usr/bin
  cp -a ${srcdir}/${pkgname}/lib ${pkgdir}/usr/lib/klong
  echo "KLONGPATH=/usr/lib/klong" > ${pkgdir}/etc/profile.d/klong.sh
}
