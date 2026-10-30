pkgname=openvox8-agent-bin
_pkgname=openvox-agent
pkgver=8.31.2
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
b2sums_x86_64=('69531cc536679b843cec00c43b8f2c632902b42942dad8d3f188c1b423b434340760656d22faa26dbd20e4a180beeb2eaab49ee0c3784aec929c0e2836ba1888')
b2sums_aarch64=('3aeb095735c17ce52f19e32f37e46e6fed8cc88437b0fb03515037a60b31bef9da9bbd9fd0d8d336753d0f27102d8faf7bb9685afe621aa4156a2dff50fc4583')
b2sums_armv7h=('d40d74ff0fae50b9c51860a5453509ee760a2d42e43ab5e5c86fa311ad0f04a616ab44d4656c92a79d573676aec7d48ee93bc191b996702c2ee34ac760c5e472')
