pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.2.0
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
b2sums_x86_64=('596190e1212b531b3b9680d09f9c1e92b5a7091a3986b7fadada13e0bf925b0139f3dda064c7b4bea3351884a039084e9d8ea3504ff727150984b1b0b227a109')
b2sums_aarch64=('9bb3d7f35d0952760c6aeaae8801e1b672532e30e738a195e6dfce1607d81fc9e935a116bfc8d2a69fea32152bbea302009f48fa3431d646fcefa071f777b13e')
b2sums_armv7h=('38b6871300a59b66c132d93bdda77cd6a3d403b73984b1aef4f23492dbcd10c4b55ffba42a90ded226b4cb22b8bcdde159fd3cecafca95b1af5c693d0ebd03d6')
