#Maintainer: allencch <allencch at hotmail dot com>
pkgname=selektor
_minor=73
pkgver=3.13.${_minor}
pkgrel=2
pkgdesc="Tor launcher and exit node chooser"
arch=('any')
depends=('tor' 'java-environment')
url="http://www.dazzleships.net/?page_id=71"
license=('GPL2')
source=("${pkgname}-${pkgver%.${_minor}}-${_minor}.tar.gz::https://www.dazzleships.net/?wpdmact=process&did=NC5ob3RsaW5r")
sha256sums=('b57b5a751fb1db549c31943cace7804a34e7298982ebd0949e4caa4ab2fe3da5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver%.${_minor}}.${_minor}
  sed -i -e 's|^proguard|#proguard|g' -e 's|^rm|#rm|g' build-jar
  ./build-jar
}

package() {
  destfolder="${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "$destfolder"

  cd ${srcdir}/${pkgname}-${pkgver%.${_minor}}.${_minor}
  sed -i -e 's|/usr/share|/opt|' packaging/selektor

  cp packaging/applications packaging/man "${pkgdir}/usr/share" -rf
  cp "packaging/${pkgname}" "${pkgdir}/usr/bin" -rf
  cp build/SelekTOR.jar packaging/doc packaging/icons "$destfolder" -rf
}
