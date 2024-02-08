# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.7.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Indexer for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'coreutils'
);
optdepends=(
);
validpgpkeys=(
  '9E646BB0630C8FD18ACD15541B93E6A766CD229D' #madara125 GPGKey
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
  'wazuh-indexer-4.7.2-1.x86_64.rpm.sig'
)

backup=(
  'etc/wazuh-indexer/opensearch.yml'
  'etc/wazuh-indexer/certs'
  )

sha512sums=('e6de824af7712efeef923040a3d086db6e180576af61772140cdf5b30a02655cbe0b615eec40a8b18e9a28df06ddd465e4a44affde5919a64e5a1913bc142ca0'
            'SKIP')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .
    
    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer-performance-analyzer.service
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer.service
}
