#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=viper-framework
pkgver=1.3
pkgrel=5
pkgdesc="Stable version of Viper the Binary Analysis Framework"
arch=("any")
url="https://github.com/botherder/viper"
license=("BSD")
depends=(
  "python2-pyexiftool" "python2-pylzma" "python2-bottle" "python2-pyelftools" 
  "python2-bitstring" "python2-dnspython" "python2-m2crypto" "python2-pyasn1" 
  "python2-requests" "python2-sqlalchemy" "python2-prettytable" "python2-magic" 
  "python2-pydeep" "ssdeep" "python2-ssdeep" "python2-beautifulsoup4" 
  "python2-pefile" "python2-crypto" "python2-olefile" "python2-oletools") 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/botherder/viper/archive/v${pkgver}.tar.gz" "viper-cli" "viper-web" "viper-api")
sha512sums=('48250758cdac0fe007cddb34060f45e43762b670528f43e7a82b9c4c4f4696d43b9e25843a9615e94ea2324b47c7b49ed9613d70bd79a6a27670dc5b102717e9'
            'df73eff87c692a5ba1d76e7ae70c8eac6c5de4075a3ee35e80297bad9d71fce413875825b87a36639d649e19224fcb1abadf1aa42c3dc33f8dcd208efd3bf8e9'
            '5dd06dfbdd1c3363bdfef3d69e9c32340e0ec897770f1a17de0a5bbe5726dfba5003fea7e9a2124d3d960b83efbe4ac1bf72be7dc4ee24d60bdc924714e3aa7a'
            'cbc6009447fc57245fac4b1143402306bc6979c5031f2589a085134d0219b248682ed7355a4766335bb61e027f6d7b1ee9154fe78a3ebb88ed36275a4d4077da')
install="viper-framework.install"

build() {
  cd "viper-${pkgver}"
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd "${srcdir}/viper-${pkgver}"
  mkdir -p "${pkgdir}/opt/viper/"
  mv * "${pkgdir}/opt/viper/"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}/opt/viper/"{viper.py,api.py,web.py,update.py}
  mkdir -p "${pkgdir}/usr/bin/"
  install -m755 -D "${srcdir}/"viper-{cli,web,api} "${pkgdir}/usr/bin/"
}
