# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.7.4
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
  '9E646BB0630C8FD18ACD15541B93E6A766CD229D' #madara125 GPGKey
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)

source_aarch64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm"
                "${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm.asc")
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm"
                "${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm.asc")

backup=(
  'var/ossec/etc/client.keys'
  'var/ossec/etc/local_internal_options.conf'
  'var/ossec/etc/ossec.conf'
)

sha512sums_x86_64=('fe0fae5ebd170a26309ae4710915b2bfeb4211328204150d2546b10a47585154166b02c86c7bb0f562155f440fd7213361d43c0e950b8588444776b99e0b7cb6'
                   'SKIP')
sha512sums_aarch64=('00490595169a792a8dcc9a718f798c5136b8670e329a037c2fbeac5a600993e6888eb4bd2e198da2d613ea6d271529d5a93bfbdfa13dff5957596b22428c5aa0'
                    'SKIP')

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
