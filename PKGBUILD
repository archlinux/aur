# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=unidbg-fetch-qsign
_version=1.1.8
pkgver="${_version}"
pkgrel=1
pkgdesc='获取QQSign参数通过Unidbg'
arch=('any')
url='https://github.com/fuqiuluo/unidbg-fetch-qsign'
license=('GPL3')
depends=('java-runtime>=8' 'sh')
makedepends=('java-environment>=8')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha512sums=('7fc2ef02b2d5d578124bed0460658332487053521dbcc75548b4ee0fb03486d3025dffb9027d6f7d1b8fc2e9e97543b95d4af56852e9b0f01859a92858d3315e'
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
