# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-manager
pkgver=4.14.3
pkgrel=1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgdesc="Wazuh Manager for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
  'wazuh-filebeat'
  'curl'
)

optdepends=(
)

validpgpkeys=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

sha512sums=('987acc2e344586dba932a23f09d6ba2c98a5a860925436a65da9fdf1032e4f70c71b1b2fd499e3939c2f2ae9557e8e411ad94b7549a721cdf4e6d34f7efb80fd')

install=$pkgname.install

package() {
  #Setup
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .
  mv $srcdir/var .

  #change permissions (owner will be set in post_install when user exists)
  chmod -R +w "$pkgdir/var/ossec"

  #Set systemd service file perms
  chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-manager.service
}
