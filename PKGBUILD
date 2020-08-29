# Maintainer: kaptoxic@yahoo.com
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>

pkgname=checkstyle
pkgver=8.36
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
arch=('any')
license=('LGPL2.1')
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
url='http://checkstyle.sourceforge.net'
source=("https://github.com/checkstyle/checkstyle/archive/checkstyle-${pkgver}.tar.gz"
       'checkstyle')
sha256sums=('7f8e543e7947daa0febe2e73f75c671e3ae39ce5468c0a59f0ed5a545e9a9144'
            '5bf5f7e688aec23fce2a507384c595ac44339ace5bb9624fc8be61e036688234')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/"
  mvn -Passembly clean package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/"
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "target/${pkgname}-${pkgver}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
