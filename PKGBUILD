pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.31.1
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
b2sums_x86_64=('201699ec2bf5c6526252c7ff7b8782627f9b1cf373a510b93ec1e52712fed006897681db5bda235697965e6f2c1c73e0237777a463e85dca33d44ad8ef5a55c2')
b2sums_aarch64=('e39dfbd7ee2bed78918df54f9f9072bb9699ce9580424fa6aca2159912f686631818c5e7e445dc0b6105d82f6d921444b63d1935822ffd4631e0ef504ec7dbd1')
b2sums_armv7h=('5f24af028cf95575603249d7119fe17b3269c261e3ac8841a75a5b4c0960dfa46a1802fa9be88192e138a8247851ecd7fa27e9828d90c3fb277c3ba3f28555ab')
