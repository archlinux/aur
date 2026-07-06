# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Aditya Sirish <aditya@saky.in>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=9.10.1
pkgrel=1
pkgdesc="An all purpose Java bytecode manipulation and analysis framework"
arch=('any')
url="https://asm.ow2.io/"
license=('BSD')
depends=('java-runtime')
_repository='https://repository.ow2.org/nexus/content/repositories/releases/org/ow2/asm'
source=("${_repository}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.jar"
        "${_repository}/${_pkgname}-analysis/${pkgver}/${_pkgname}-analysis-${pkgver}.jar"
        "${_repository}/${_pkgname}-commons/${pkgver}/${_pkgname}-commons-${pkgver}.jar"
        "${_repository}/${_pkgname}-tree/${pkgver}/${_pkgname}-tree-${pkgver}.jar"
        "${_repository}/${_pkgname}-util/${pkgver}/${_pkgname}-util-${pkgver}.jar"
        "${_repository}/${_pkgname}-test/${pkgver}/${_pkgname}-test-${pkgver}.jar"
        LICENSE)

sha256sums=('ed825d10ab1399c8c0cb669e688cf0c8c82629b4c8399b58352b68e92ca10fcb'
            'dede75a21306b65974ecd8f87114ff6970f09fb794157a4ca09ab25c888c2bfc'
            '6d0abefb7cbf972ea16edb37ec14835372505063a45f976ab7ea889ed9497895'
            '3dfb0d5b6a106cd40b5b250e39935fbf2f927f4477546a5369a3ac609cf0506b'
            '1bb99d091fba2597dc6d51193e9bbcf0d8447e7ed96bd8f0198b18152f09655c'
            '3811c0992a802654a182ba7c289eb54d185f44eefa13eb6a42277c9810cab655'
            '02f021ae8f8f2f205d36b20790eedd6a871dd3007ddf160c8692b6f3a3284fc7')

package() {
  mkdir -p ${pkgdir}/usr/share/{java/$_pkgname,licenses/$pkgname}

  cd "${srcdir}"

  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  for i in *.jar; do
    install -m 644 ${i} ${pkgdir}/usr/share/java/${_pkgname}
    _tmpfilename=${i##*\/}
    ln -sf ${_tmpfilename} ${pkgdir}/usr/share/java/${_pkgname}/${_tmpfilename/-[0-9]\.[0-9]/}
  done
}

