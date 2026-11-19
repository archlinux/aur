pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.34.0
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
b2sums_x86_64=('417cdfe4a42848f1178dcd4ddf42a6e3736a51cef90bc10079a62b33429e0020a6ad5c225ad082e3ef67dc0106054a12b4b5e0862741d8741c194a700bd1b9f1')
b2sums_aarch64=('f9ad023dc67ed2e15146c6ad1724af2dad629687e8336e4ad70c08fad41ba125eb90643e4f4e0c4b4aa2d8c0817fa0632843e12973f79773b46c2f922d89ad5b')
b2sums_armv7h=('e6e9785cb6e0a8b4c0579aa3cd3e6426b744ebac0f478324f91913efcb256760c7a4ed1ef1e2e556ac92e5079b5ab7a5b29001a28e2cb69777122193606514fc')
