
# Maintainer: Morten Linderud <morten@linderud.pw> 
# Contributor: mmm
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>

pkgname=protege
pkgver=5.2.0
pkgrel=3
pkgdesc='Free, open source ontology editor and knowledge-base framework'
arch=('any')
url='http://protege.stanford.edu/'
license=('MPL')
depends=('java-runtime>=8' 'graphviz')
makedepends=('maven' 'jdk8-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/protegeproject/protege/archive/v$pkgver.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('92dd736e74b7f49cbb019e77897a59a492e4de9683dd27fd7cc9084bf1e05317'
            '9b0a6692d04da727ba9473399c1fdf68a85c5ec680582f79b3e46642c8cceca6'
            'e0e054d864fafdee0c7a7a034b4a92fe2fe30fcce77f2aabd71afb57dbbbb0ab'
            '3ee61d8cfcbcfc91c86c9dddc24e40f9fc0e6943bf879548340610c95d64d194')

build(){
  cd "protege-$pkgver"
  mvn clean package -Dmaven.test.skip=true
}

package() {
  cd "protege-$pkgver/protege-desktop/target/protege-$pkgver-platform-independent/Protege-$pkgver"
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -r * "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -D "${srcdir}/protege.sh" "${pkgdir}/usr/bin/protege"
  install -Dm644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
