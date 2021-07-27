# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=9.2
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

sha256sums=('b9d4fe4d71938df38839f0eca42aaaa64cf8b313d678da036f0cb3ca199b47f5'
            '878fbe521731c072d14d2d65b983b1beae6ad06fda0007b6a8bae81f73f433c4'
            'be4ce53138a238bb522cd781cf91f3ba5ce2f6ca93ec62d46a162a127225e0a6'
            'aabf9bd23091a4ebfc109c1f3ee7cf3e4b89f6ba2d3f51c5243f16b3cffae011'
            'ff5b3cd331ae8a9a804768280da98f50f424fef23dd3c788bb320e08c94ee598'
            'c51f82ddb3d2eaad1c8eeb7096081f8f660baa25dce7388d8653580d3ffb3570'
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

