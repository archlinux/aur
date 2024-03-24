# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.7.3
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
                "${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm.sig")
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm"
                "${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm.sig")

backup=(
  'var/ossec/etc/client.keys'
  'var/ossec/etc/local_internal_options.conf'
  'var/ossec/etc/ossec.conf'
)

sha512sums_x86_64=('c627cd2f393d811d501c370e23ba57aa293822f9688d1cf7d235224c6f6fd5847723694153e5ed35e9b0f6364b40eea16d6b4305599b11a676adc6b61a7e1d74'
                   'SKIP')
sha512sums_aarch64=('8ef82066e703443f2448fafe086a5795c82aeed52859085a3269d0e4628875f8d803c7a76e50e506d4b1c33162a065f030813ba8dbd273be3351a0a0cb14e281'
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
