# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=ibmcloud-cli
pkgver=0.14.0
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
sha256sums_x86_64=('cc0fc07bdb4522c374c103e5c7f9f5f648602301f1585bc92b586835c6041208')
sha256sums_i686=('0f652d49f917607ee5d0834bab74d0acc2fed3a2b4c5bd74cce503ba7aeb39cd')

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
