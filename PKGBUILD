pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.33.1
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
b2sums_x86_64=('30d253cb3568c25791aeec1894d13dffc7a44372c08842469586f102d9eee683979c6700627affc02da14b3178cb8bb7202ecb84a4626dddab084747b594f3c6')
b2sums_aarch64=('063935d2c416ce8f1140abf843e6ced0f6aa2363803abf8cb2abac8b86b0297f8b6d622155be6e1350f010d401f45a89d7b096b1439272f6086b1c80819f2b6c')
b2sums_armv7h=('023cd43952c0f60b3ca65a16f879c9d4da51c6168aeedfffe2aba6c6ac4541f9b3aff5cc5426837f6d7ec81a5e4b4060bf5859b4dcb8c270ba0dc24ee2821909')
