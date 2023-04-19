# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apifox-bin"
pkgver=2.2.33
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://apifox.com/"
license=('custom')
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('gtk3' 'lib32-gcc-libs' 'nodejs' 'nss' 'at-spi2-core' 'java-runtime' 'alsa-lib' 'libxdamage' 'expat' 'cairo' 'libx11' 'dbus' \
  'nspr' 'libxrandr' 'lib32-glibc' 'libxext' 'gcc-libs' 'libxcomposite' 'libxcb' 'glib2' 'libcups' 'libdrm' 'glibc' 'libxkbcommon' \
  'libxfixes' 'hicolor-icon-theme' 'pango' 'mesa' 'sh')
options=(!strip)
source=("${pkgname%-bin}-deb-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-deb-latest.zip"
  "LICENSE.html::${url}/help/app/faq/")
sha256sums=('8a44c1c1d385edd64defb94c739fe21c518b216cdc32baecef6eb137b7705f21'
            'd6411651b59c49d7cfb6cbc3736e669c90a9db7a7c0370dc50039f18a0fcd650')
   
package() {
    ar -x "${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/opt/Apifox/resources/app/node_modules/sshpk/man/man1" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/ajv/scripts/info" \
          "${pkgdir}/opt/Apifox/resources/app/node_modules/oas-validator/node_modules/ajv/scripts/info"
}