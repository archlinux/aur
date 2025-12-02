# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=ibmcloud-cli
pkgver=2.39.0
pkgrel=1
pkgdesc="Command line client for IBM Cloud"
arch=('x86_64' 'i686' 'aarch64')
url="https://console.bluemix.net/docs/cli/reference/ibmcloud/all_versions.html"
license=('CUSTOM')
depends=()
provides=('bluemix-cli')
conflicts=('bluemix-cli')
replaces=('bluemix-cli')
source_x86_64=("https://download.clis.cloud.ibm.com/ibm-cloud-cli/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_amd64.tgz")
source_i686=("https://download.clis.cloud.ibm.com/ibm-cloud-cli/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_386.tgz")
source_aarch64=("https://download.clis.cloud.ibm.com/ibm-cloud-cli/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_arm64.tgz")
sha256sums_x86_64=('03426dda620deb0f4c61a93a9b0e3dc8a86c89dedd355c15cbfed6b1e2c1b22c')
sha256sums_i686=('bff53c2a8e279c8f6f954f3763d1729b93b2094ff6b3e52241bb4405b88ed424')
sha256sums_aarch64=('2d05dbff3c93430ddbfb77f10deefa9a6589428dc3682670ae919e9172ace9b9')

package() {
  cd "${srcdir}/IBM_Cloud_CLI/"

  mkdir -p "${pkgdir}/opt/ibmcloud/"
  install -D "NOTICE" "${pkgdir}/opt/ibmcloud/bin/NOTICE"
  install -D "LICENSE" "${pkgdir}/opt/ibmcloud/bin/LICENSE"
  install -D "ibmcloud" "${pkgdir}/opt/ibmcloud/bin/ibmcloud"
  install -D "autocomplete/bash_autocomplete" "${pkgdir}/opt/ibmcloud/autocomplete/bash_autocomplete"
  install -D "autocomplete/zsh_autocomplete" "${pkgdir}/opt/ibmcloud/autocomplete/zsh_autocomplete"

  install -d "${pkgdir}/usr/bin"

  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/opt/ibmcloud/bin/bluemix"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/opt/ibmcloud/bin/bx"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/bluemix"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/bx"
  ln -sf /opt/ibmcloud/bin/ibmcloud "${pkgdir}/usr/bin/ibmcloud"

  install -d "${pkgdir}/usr/share/bash-completion/completions"

  ln -sf /opt/ibmcloud/autocomplete/bash_autocomplete "${pkgdir}/usr/share/bash-completion/completions/ibmcloud"

  chown -R root:root "${pkgdir}/opt/ibmcloud/"
  chmod -R 755 "${pkgdir}/opt/ibmcloud/"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
