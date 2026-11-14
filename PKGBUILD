pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.4.0
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox' 'openvox8-agent-bin')
provides=('puppet' 'openvox')
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')

source_x86_64=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")
source_aarch64=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_arm64.deb")
source_armv7h=("https://apt.voxpupuli.org/pool/openvox9/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_armhf.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  "${srcdir}/data/opt" "${pkgdir}/"
    cp -a  "${srcdir}/data/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('a095bf442e8acd61bcf6e990fc5dc88963e3a55b42078626a6b746c9901bcc8a2960456778db85fb126d087a00ab89ac20ac6f3d707100b58d4e99975ea8e8e8')
b2sums_aarch64=('54918b67f8907ec54b6a6a6c7dfb4d3e598b5afcef4fe056430d97754ae1d206c75036aa0ea7003dcd83ecb978ae3770beebee1d0e07efc2f16d1f189f99b2dd')
b2sums_armv7h=('4121bf53f069f45cffa45a4d1cebc4e5d5103b77ba834223d9a38501634888cf008f60524e18330c75807722f3957eaf73a9ec7c12ae9599b764a21a3c0b05a8')
