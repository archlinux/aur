# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=unidbg-fetch-qsign
_version=1.1.7
pkgver="${_version}b2"
pkgrel=1
pkgdesc='获取QQSign参数通过Unidbg'
arch=('any')
url='https://github.com/fuqiuluo/unidbg-fetch-qsign'
license=('GPL3')
depends=('java-runtime>=8' 'sh')
makedepends=('java-environment>=8')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha512sums=('bc42a1ba2bbc33132e64b511b5b5d499ca2a78696b134cd33851746f69fb3028ea9bfa24135cfb131f5423013b26acadbcf04f7df6838d3ba813c91ef4161d72'
            '58ad99a40219bc692566d51b2124dde6385289905b1f25e462a109730c4515cf4bb9d02f1a66cc867892550a3d00c8346745a6d7509b992303044f0db547a55d')

build() {
  cd "${pkgname}-${pkgver}"
  ./gradlew --no-daemon assemble
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libs/${pkgname}-${_version}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
