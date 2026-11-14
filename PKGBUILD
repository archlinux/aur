pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.33.0
pkgrel=1
pkgdesc='Agent of the OpenVox Automation Framework (non-modular)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://voxpupuli.org/openvox/'
license=('Apache-2.0')
depends=('libxcrypt-compat')
options=('!debug')
conflicts=('puppet' 'openvox' 'openvox-agent-bin')
provides=('puppet' 'openvox' 'openvox-agent-bin')
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
b2sums_x86_64=('1134f10f5bf02b3d1e6ce9c9cb7a0981c9685f94a826214364a04b0eccb85cc91d05f94921a0799618de5a2629a4fccf180edbaca0e7fc105e2e19fae74abbfa')
b2sums_aarch64=('1e957384f13d9ad0935e1d069a483c56904eb02bddc4488de23a571dbf5cd17e0255077374fc87afe225900efb36c9eda637ff51e69f988e0fefcbd0c8b1a8eb')
b2sums_armv7h=('9fca05ce301d5a0c3ebbcbcf1067cc73a5af97210e2ef98dd526b9e2e07c60046577501e06ebfafdd7dd0a92ee46c863dd213a570934ead388952a3cfabcb267')
