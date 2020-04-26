# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=tomighty
pkgver=0.7.2
pkgrel=2
pkgdesc='Desktop timer for Pomodoro Technique users'
arch=('any')
url='http://www.tomighty.org/'
license=('Apache')
depends=('bash' 'java-runtime')
makedepends=('imagemagick' 'maven' 'git')
source=("git+https://github.com/tomighty/tomighty.git#branch=version-0.7"
        pomxml.patch
        tomighty.sh
        tomighty.desktop
        https://github.com/ccidral/tomighty/raw/50d0094c024f1923bd0d6ff1bf77572ae5f5b5f6/img/tomato.ico)
b2sums=('SKIP'
        'd45294e81aeab757cc998e2f536f33811483fb892683a9028dabeafe79fa0a889b99fac52c16644ad70ec0e0de243fbf309803d86665c1c86b4a6cb2893f5632'
        '58b9e411c44828d1918debde1f8acbe27d55bdf2b4627ce3a159900665e2489765fa2788afcef512c38974d0faf8d51451ff6ecf051ad0b689495694e3a333b9'
        '81f2d61e4f565f9ea25e6bb402096ff26a073384f332cea697d01b474db23dfcd53fa2e7abcc1e0d67e5750fe04b00742a1f9bab00d29337c2b3c3cf0f85eccb'
        'c97f7f44f6023031b0e98216ee7a806c481fe11b27aab362c6e60f54745e2c4c4fb5c0e0a8c5530d3ea4080e377c26ed2585b67bef2eeac2bd6aa51cc198c906')

prepare() {
  cd ${pkgname}
  patch -p0 < "${srcdir}"/pomxml.patch
}

build() {
  cd ${pkgname}
  mvn clean package
}

package() {
  convert tomato.ico tomato.png
  install -Dm 644 tomato-0.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png

  install -Dm 644 ${pkgname}/target/${pkgname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm 644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm 755 ${pkgname}.sh "${pkgdir}/"usr/bin/${pkgname}
}
