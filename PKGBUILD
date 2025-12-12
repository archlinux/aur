# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Aditya Sirish <aditya@saky.in>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=9.9.1
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

sha256sums=('6f3828a215c920059a5efa2fb55c233d6c54ec5cadca99ce1b1bdd10077c7ddd'
            '6260bffc8ec008dd1b713702c7994e2c94d188a3da5bef9e87278a16df6a7522'
            'c2319e014ce7199f2b7f7d56d6bb991863168c3f4b6cd6c9f542a4937ef7ef88'
            '0f3555096b720b820bbacab0b515589bee0200bee099bda14c561738ae837ba1'
            'c5ebbbeaf68126af094b42fa4800f59bc4413abd02d95b9aefad722cd257e207'
            '32686ffa2a01cd32706d0148d776f78ef0dc6d4dc9c7d7cfa05ccbc3a88b1cbe'
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

