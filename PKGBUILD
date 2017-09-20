# Maintainer: kaptoxic@yahoo.com
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

pkgname='checkstyle'
pkgver='8.2'
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
arch=('any')
license=('LGPL2.1')
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
url='http://checkstyle.sourceforge.net'
source=(
  "https://sourceforge.net/projects/checkstyle/files/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz/download"
  'checkstyle')
md5sums=('1a61a8dd39e8886fe59ec350686a033f'
         '2059277aee1e877eab1d127a0110d1c3')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/"
  mvn -Passembly clean package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgname}-${pkgver}/target/${pkgname}-${pkgver}-all.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
