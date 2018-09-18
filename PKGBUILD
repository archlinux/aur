# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostream-web
pkgver=2.0.1.5649
pkgrel=1
pkgdesc="EvoStream web services and web user interface"
arch=('any')
url="https://evostream.com/"
license=('custom')
makedepends=('poppler')
install="${pkgname}.install"
source=("http://apt.evostream.com/release/debian/9.4/pool/main/e/evostream-web/${pkgname}_${pkgver}-1_all.deb"
        "https://evostream.com/public/files/Evostream-Media-Server-EULA-v2.pdf")
md5sums=('6ab8c9a2b6f20629a011c8a9a8b12e48'
         'ee93910c6589b26c8eb056921f1944f8')
noextract=("Evostream-Media-Server-EULA-v2.pdf")

build() {
  pdftotext ${srcdir}/Evostream-Media-Server-EULA-v2.pdf
}

package() {
  mv ${srcdir}/data.tar.xz ${pkgdir}
  cd ${pkgdir}
  bsdtar -xf data.tar.xz
  rm data.tar.xz

  install -Dm644 "${srcdir}/Evostream-Media-Server-EULA-v2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
