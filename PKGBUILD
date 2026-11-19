pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.5.0
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
b2sums_x86_64=('126c6c99987f3a05a7be93f2a14da87d5e969a5b4ee78b41e2ef841dae54905310c120cae96e77b90900fc85187617c40fd534c0596a5847509cac6c2f2ef4fd')
b2sums_aarch64=('75b23032b1032a98c17ae2a2e283e93976fa1858d9c767c446d7d1192978f84edaba9a1e48272d6f616b529b1fd3cb82e8f4a2055f471eb74ce54fb32f4605c4')
b2sums_armv7h=('30fe7a7d180db57e0c03ae6024b2e0934d437fa72217fdc6bc941a40fe4c958467793d6c28704737b905bccaf8ab494ccf9a20c958e6a0fc66ee4cbd7459c3f4')
