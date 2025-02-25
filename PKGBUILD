# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.11.0
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Agent actively protects Arch Linux systems with advanced threat prevention, detection, and response capabilities."
arch=('x86_64' 'aarch64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'curl'
    'gcc'
    'make'
    'sudo'
    'wget'
    'expect'
    'gnupg'
    'perl-base'
    'perl'
    'fakeroot'
    'python'
    'brotli'
    'automake'
    'autoconf'
    'libtool'
    'gawk'
    'libsigsegv'
    'nodejs'
    'base-devel'
    'inetutils'
    'cmake'
);
optdepends=(
    'lsb-release'
);

validpgpkeys=(
)

source_aarch64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm"
                )
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm"
                )

backup=(
  'var/ossec/etc/client.keys'
  'var/ossec/etc/local_internal_options.conf'
  'var/ossec/etc/ossec.conf'
)

sha512sums_x86_64=('60dfe5150698e1b56029810671108d65e695b566adea6b68aaae2f27c747670b655f38ae1d83b862e3a6cba6452e8e7bd5e9840746ad1a45fddbb56d875cb61e')
sha512sums_aarch64=('c65f32e949375e9e67878882930bfb5d50530808c7ebef22e842a27b61b4a7ad5234338dff9e51d603e0cef0824cc4e6026e6b0da176a92f896dbf25cb0edff1')

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
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-agent.service
    
}
