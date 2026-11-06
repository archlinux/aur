# Maintainer: Cédric Connes <cedric.connes@gmail.com>
pkgname=ibmcloud-cli
pkgver=2.49.0
pkgrel=1
pkgdesc="Command line client for IBM Cloud"
arch=('x86_64' 'i686' 'aarch64')
url="https://console.bluemix.net/docs/cli/reference/ibmcloud/all_versions.html"
license=('CUSTOM')
depends=()
provides=('bluemix-cli')
conflicts=('bluemix-cli')
replaces=('bluemix-cli')
source_x86_64=("https://download.clis.cloud.ibm.com/ibm-cloud-cli-dn/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_amd64.tgz")
source_i686=("https://download.clis.cloud.ibm.com/ibm-cloud-cli-dn/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_386.tgz")
source_aarch64=("https://download.clis.cloud.ibm.com/ibm-cloud-cli-dn/${pkgver}/binaries/IBM_Cloud_CLI_${pkgver}_linux_arm64.tgz")
sha256sums_x86_64=('4df63ffd736bf475e72b6ca75698da3bb25780f947d03f1149d274da07f2c32e')
sha256sums_i686=('b1a8846726f483c756572b526e589e04870449b2520715037a8536dbac3ae979')
sha256sums_aarch64=('8c4df1ca97da0971ad46b2d051e69e216bddfd295afc63ee9a5dc3dc667927eb')

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
