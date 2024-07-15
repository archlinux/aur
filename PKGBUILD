# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-manager
pkgver=4.8.0
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Manager for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'wazuh-filebeat'
);
optdepends=(
);
validpgpkeys=(
  '9E646BB0630C8FD18ACD15541B93E6A766CD229D' #madara125 GPGKey
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

backup=(
  'var/ossec/etc/client.keys'
  'var/ossec/etc/local_internal_options.conf'
  'var/ossec/etc/ossec.conf'
)

sha512sums=('32fce7447a456fcc041438e8967fbe1119aba72a3d2bc5412977292ba224174dde3a5b5824432a84c340c164e2b8ab4d832cc22bdc7a4124c77eb1afebfd80f9')

install=$pkgname.install

package() {
    #change permissions
    chmod -R +w "$srcdir/var/ossec"
    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .

    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-manager.service
}
