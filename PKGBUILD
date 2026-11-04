pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.32.0
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
b2sums_x86_64=('f1f11772931ecdf03695071fac7a715743b0f8e5a7954d344b755626e6f2853804b2a563520cdab8dd47a4a8aad3cdf87b8ebc74378086d6921051963b82707f')
b2sums_aarch64=('7a00f4b335d129f53d2adbb3cac483d3eb4ee0351b8a575de3e3b57b42004cb43c8de8653255c04b68a13ba91a3c2e711308f8019f95b6f93eefbad5321278b9')
b2sums_armv7h=('92345617a8a56b3f53f565fa566c483aae3ce0c87516454e7351df251793cc07d6c1ee4bc141e011d3828d917626520f21fc84fb991d968d0986517001e970d2')
