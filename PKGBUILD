# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Aditya Sirish <aditya@saky.in>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=9.9
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

sha256sums=('03d99a74ad1ee5c71334ef67437f4ef4fe3488caa7c96d8645abc73c8e2017d4'
            '6a15d28e8bd29ba4fd5bca4baf9b50e8fba2d7b51fbf78cfa0c875a7214c678b'
            'db2f6f26150bbe7c126606b4a1151836bcc22a1e05a423b3585698bece995ff8'
            '42178f3775c9c63f9e5e1446747d29b4eca4d91bd6e75e5c43cfa372a47d38c6'
            '3842e13cfe324ee9ab7cdc4914be9943541ead397c17e26daf0b8a755bede717'
            'fd0e78c7040b3184656f8381bae68382859542ef5d8f196ce94dc06a1adfd2ea'
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

