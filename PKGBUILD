# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=7.0
pkgrel=1
pkgdesc="An all purpose Java bytecode manipulation and analysis framework"
arch=('any')
url="https://asm.ow2.io/"
license=('BSD')
depends=('java-runtime')
_maven_central='http://repo.apache.maven.org/maven2'
source=("${_maven_central}/org/ow2/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-analysis/${pkgver}/${_pkgname}-analysis-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-commons/${pkgver}/${_pkgname}-commons-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-tree/${pkgver}/${_pkgname}-tree-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-util/${pkgver}/${_pkgname}-util-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-test/${pkgver}/${_pkgname}-test-${pkgver}.jar"
        LICENSE)


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

sha256sums=('b88ef66468b3c978ad0c97fd6e90979e56155b4ac69089ba7a44e9aa7ffe9acf'
            'e981f8f650c4d900bb033650b18e122fa6b161eadd5f88978d08751f72ee8474'
            'fed348ef05958e3e846a3ac074a12af5f7936ef3d21ce44a62c4fa08a771927d'
            'cfd7a0874f9de36a999c127feeadfbfe6e04d4a71ee954d7af3d853f0be48a6c'
            '75fbbca440ef463f41c2b0ab1a80abe67e910ac486da60a7863cbcb5bae7e145'
            '004997b99fe2648261cd57c6a7fc7b598bf22e20e2a8f05cbec989fa4772167f'
            '02f021ae8f8f2f205d36b20790eedd6a871dd3007ddf160c8692b6f3a3284fc7')
