pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=8.29.0
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
b2sums_x86_64=('ee0b68f520de4cda3b2c938ca32d9d13d1f0baf12e1958b7a878af61028eb85b11840e2be20a5980ad314274c0a15e86acd37dedc425869a8c1761d2c657dafd')
b2sums_aarch64=('b8876927268234034ef811d427500672b7d20b6834a1fd330d49faa8559992f3285e05e7e32b657c6bff2b20c735a38fe7d833fbd76af18ad85910b02557b7b9')
b2sums_armv7h=('dd20a8fdc2729b431cb5fbf63d5c0bcbb9ae9c7b2fb7768e0a06419c98e92639f2e100bdf402054e2bf69172d3eafbd24b453a7cb84022cea991eb4f05ffe634')
