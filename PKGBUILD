# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.9.2
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

sha512sums_x86_64=('11ec7cefa942f71cd7b41333ec664de7766871738b3d286734262a0a8c2bdc1192ed167eef40c72ceb3d74d54a908ce5ed3b4526ee9817227f90e7b1fc74f307')
sha512sums_aarch64=('ac97b5600b6c026ce28dc74048b47ca380ecc7227ce4e58cf08b464db501073adf3d2f98f136d5429c7bafb68886344db28930917541d1bd2c790ad02c362c60')

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
