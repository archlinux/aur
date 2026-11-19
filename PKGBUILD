pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.4.1
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
b2sums_x86_64=('b886369fc6a79102eae18a3d7d850f675d34987817d60aa1869bc2e9ca12bbf0d920bc4d6343498bcfbf5a3ff4f05392ae029583cf137cd94b5b935f632b160d')
b2sums_aarch64=('c09947535e6d5f0adeb745b72f31898b359c8a0e4fa615a759e91533eb6efd4913ca2c446441bfdd894bde022f7c604e0a191d3e780381d1ec27c128449a797a')
b2sums_armv7h=('c311aebb47db252fc4abbeb2d26432ac8d20983206b7a93623a52b5ee4d9bc7aa02239d0a7aacc7b362f894237cfeb1d0733f342a1ed2adeb24f8fce1c5835ac')
