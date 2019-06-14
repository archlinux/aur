# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=ibmcloud-cli
pkgver=0.16.2
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
sha256sums_x86_64=('d215654baf9d9719800ea719169e41f6b9b8f3dc1752760bfed15fe4c45d6456')
sha256sums_i686=('81a10e98d862d43e33abe761dae0706352c84b166f741b479c6d2dc1fac8cdc0')

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
sha256sums_x86_64=('d9c289b369b7d4110ac614dd2f813283b527c01f423585be842d414ea3e9ee12')
sha256sums_i686=('79326695e5a8bf1938cd178fffaea389b8abcc7c4d2048d900ee1fe55b3be0ff')
