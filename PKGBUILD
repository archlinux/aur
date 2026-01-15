# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-manager
pkgver=4.14.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Manager for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
    'wazuh-filebeat'
);

optdepends=(
);

validpgpkeys=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

sha512sums=('cb27b980cf193d1fdc6401645bd8c57fcd439c2434e0811f95a17d82c294479e572a7f1e25c0219339d98fd58e5e4939fa40874c385acdae17e32c0ccc6ae144')

install=$pkgname.install

package() {
    #change permissions
    chmod -R +w "$srcdir/var/ossec"
    chown -R wazuh:wazuh $srcdir/var
    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .

    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-manager.service
}
