pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.3.0
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
b2sums_x86_64=('0df0f66dcb128bc5618c3115b2bee6291a8a64986a1aee9e48bf2b1d9b6cd54bd590eb1c238944d3a18c731d02c6afdd81f6d552ad11d60ac194c08470698ed7')
b2sums_aarch64=('4629fe6c443a03feb0c65c84f9ec3cf354c303986b10680cad49efc7938aa7cf3131a6c97144e9243c46a3bedd64f399aca434bbc9a75340a2515c921a28ba53')
b2sums_armv7h=('21aceb8c83f7b36c2add7cfecf3ba90746e97f0c3d5d39223e31746aa34cdf163463d61e3f2f1274e823035ca3e5995c22c3f51d36917f808cb85341de113078')
