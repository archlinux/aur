# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.12.0
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Indexer for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
    'coreutils'
);
optdepends=(
);
validpgpkeys=(
)

source=(
    "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
    "https://arashi.solutions/wazuh-passwords-tool.sh"
    "https://arashi.solutions/wazuh-certs-tool.sh"
)

backup=(
  'etc/wazuh-indexer/opensearch.yml'
  'etc/wazuh-indexer/certs'
  'etc/wazuh-indexer/opensearch.keystore'
  )

sha512sums=('284c20e68fcb95b1306d81581ce547c7a66568f6b02f94b8ababb9b771b178980f84b7f4cc81b3cd012a20da2aa1f01a65d32e5667fb2d5fdac3e4a0ff6ffdec'
            '4d27986872d3f85562fe8cef322f49e6d0b9eff99378c4b11fa382b32a56bde55634a3e73f1a589114c2773edd9b7f57231313aba0098bded634cc61c26206fa'
            '7353b4b2c0779f443652d9b2217969af49a83f1b71f30e7ad2c6aa4d4c575a877826a7a64735f8663170eda7f7f8c7eaef91bd5ac2e6e62697f7635ecea96bf8')

install=$pkgname.install

package() {
    #only 2 files require special patches for arch: wazuh-passwords-tool.sh and wazuh-certs-tool.sh, so we replace them
    #Setup
    cd $pkgdir
    #mv -f $srcdir/wazuh-passwords-tool.sh $srcdir/usr/share/wazuh-indexer/plugins/opensearch-security/tools/
    #mv -f $srcdir/wazuh-certs-tool.sh $srcdir/usr/share/wazuh-indexer/plugins/opensearch-security/tools/
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .
    
    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer-performance-analyzer.service
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer.service
}
