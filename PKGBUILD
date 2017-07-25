# Maintainer:  kaptoxic <kaptoxic@yahoo.com>
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

pkgname=checkstyle
pkgver=8.1
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
arch=('any')
license=('LGPL2.1')
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
url='https://github.com/checkstyle/checkstyle'
source=("${url}/archive/checkstyle-${pkgver}.tar.gz"
        'checkstyle')
sha256sums=('47f5d82b577a63b2a458cc6a5f03bb6c6d4d6c21cdb332ba2fa49182b12aeed0'
            'fd16398cd50d9e066c0fcd496c50132ba054706a2bc2e8260f1111f78324edc7')

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
