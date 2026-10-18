pkgname=openvox-agent-bin
_pkgname=openvox-agent
pkgver=9.1.0
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
b2sums_x86_64=('a0df529a83a1dfa099f0a7ba747a5ba1c7e48dd351ae1ce01e2398a33f957771939d8d897cbef6c1f8ea947dc759dd7f5022a02cec8adf34378a5773ab0c7905')
b2sums_aarch64=('9c5cd1d8e433c3f6cd432f2ee8a749939c2ab724d1873bf7e27406661af91e7e0e373ce3a779fad255baa2969c548fa93f6252baad204da7a09e8b64f5376b72')
b2sums_armv7h=('7bafcabcab7fd49069cdf1423b7afb19c7025835f1cee2ae1d8f2843388ebed4760eb1129e97f08032f87f135f7a0d7a4bca1ba0c5c8f69ea814a884e3d17c80')
