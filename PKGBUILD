pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.30.0
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox')
provides=('puppet' 'openvox')
backup=('etc/puppetlabs/puppet/puppet.conf' 'etc/puppetlabs/puppet/hiera.yaml')

source_x86_64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_amd64.deb")
source_aarch64=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_arm64.deb")
source_armv7h=("https://apt.voxpupuli.org/pool/openvox8/o/openvox-agent/${_pkgname}_${pkgver}-1+debian13_armhf.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.gz -C data
}

package() {
    cp -a  "${srcdir}/data/opt" "${pkgdir}/"
    cp -a  "${srcdir}/data/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/data/lib/systemd/system/puppet.service" "${pkgdir}/usr/lib/systemd/system/puppet.service"
}
b2sums_x86_64=('f8d69d5e82c522e2f56f6082477fc5bddd7b03997a9165cb3a5f434147ed26c13dcb61a9a2ea8589f1af771b09ce77028c30df624e4f612fdb524d97a6ee134a')
b2sums_aarch64=('d975d453e693130adc936d70de0ffe7033d8f97230ea9da2332637e4e67730c621c99ee29c3450c922c71feb689a1f3deac21d85220623571d048ea247ed7e12')
b2sums_armv7h=('72ce6bb9abe74eb70d3bb8874003cb0e1856a2fd8f0669b60fafd3742296481d23928478f5f9dfd5a0e34fe06ad7d08ac712639e2548d4f29e9e64888be392b2')
