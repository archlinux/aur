# Maintainer: Aditya Sirish <aditya@saky.in>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=9.3
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

sha256sums=('1263369b59e29c943918de11d6d6152e2ec6085ce63e5710516f8c67d368e4bc'
            '37fd5392bb2cf4c15f202ffefd46d0e92bb34ff848c549f30d426a60d6b29495'
            'a347c24732db2aead106b6e5996a015b06a3ef86e790a4f75b61761f0d2f7f39'
            'ae629c2609f39681ef8d140a42a23800464a94f2d23e36d8f25cd10d5e4caff4'
            '70f78f291ca0298afdb567fa85c5667869bc3da3914784816413853994962192'
            'b981a0eb2e66feba068c07bd5b8298c454b8e6f03ec3b70efa0e6c2582450c45'
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

