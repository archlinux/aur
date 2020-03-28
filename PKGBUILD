# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=ibmcloud-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line client for IBM Cloud"
arch=('x86_64' 'i686')
url="https://console.bluemix.net/docs/cli/reference/ibmcloud/all_versions.html"
license=('CUSTOM')
depends=()
provides=('bluemix-cli')
conflicts=('bluemix-cli')
replaces=('bluemix-cli')
source_x86_64=("IBM_Cloud_CLI_${pkgver}_linux_amd64.tgz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux64/archive")
source_i686=("IBM_Cloud_CLI_${pkgver}_linux_386.tgz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux32/archive")
sha256sums_x86_64=('eabfbd6e6a4cb2bd3b8abda57139f7a27f51dd0b9e635e0fee57b70e593fe61d')
sha256sums_i686=('bde6332b9c8ae9d4558d7873d3751b57b6677fcd34f0b7a46c7ba3c99bbfd092')

package() {
  cd "${srcdir}/IBM_Cloud_CLI/"

  mkdir -p "${pkgdir}/opt/ibmcloud/"
  install -D "NOTICE" "${pkgdir}/opt/ibmcloud/bin/NOTICE"
  install -D "LICENSE" "${pkgdir}/opt/ibmcloud/bin/LICENSE"
  install -D "ibmcloud" "${pkgdir}/opt/ibmcloud/bin/ibmcloud"
  install -D "ibmcloud-analytics" "${pkgdir}/opt/ibmcloud/bin/ibmcloud-analytics"
  install -D "cfcli/cf" "${pkgdir}/opt/ibmcloud/bin/cfcli/cf"
  install -D "autocomplete/bash_autocomplete" "${pkgdir}/opt/ibmcloud/autocomplete/bash_autocomplete"
  install -D "autocomplete/zsh_autocomplete" "${pkgdir}/opt/ibmcloud/autocomplete/zsh_autocomplete"

  install -d "${pkgdir}/usr/bin"

  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/opt/ibmcloud/bin/bluemix"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/opt/ibmcloud/bin/bx"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/bluemix"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/bx"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/ibmcloud"
  ln -sf /opt/ibmcloud/bin/ibmcloud-analytics "${pkgdir}/usr/bin/ibmcloud-analytics"

  chown -R root:root "${pkgdir}/opt/ibmcloud/"
  chmod -R 755 "${pkgdir}/opt/ibmcloud/"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
