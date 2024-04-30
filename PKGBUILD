# Maintainer: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.43.3
pkgrel=1
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)
source=(nextdns.service)
source_x86_64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz)
source_i686=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_386.tar.gz)
source_aarch64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_arm64.tar.gz)
source_armv7h=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_armv7.tar.gz)
sha256sums=('00b0c930275df825475b0d86062f7488131f1b2b5e16e5ec6f9983e53138505b')
sha256sums_x86_64=('aa9d10d3b212a5eeb7c36305faeb8f6d15c5231e9070660129854e5c12d95be6')
sha256sums_i686=('ef670a3aaac61164fa32e574da990b4b09333062d713117d3bbfed0e75950254')
sha256sums_aarch64=('d6685ec3f830744de057072364605f334561511968839f4a0f30d9bb07671b14')
sha256sums_armv7h=('53395af8359f51d0bf14cc977be7e84b40ce9c26c1d5866080e08466565e94a0')
b2sums=('cf97472882f3db8e4debbe9aaefd8fddb2c78b1221045b556b486e5adb2448c28ce8c9e49bf54e85858a25760bf6d981c55117975b94039ac48cd24e87e12ec6')
b2sums_x86_64=('6937fd662e28dac95127709507deabb23eb3fd08cb37438e4ccdfe087cb066263e9ee58a32896f67318ac2787fa48fc0220db186bb1e4bd0ec8f0af62d664910')
b2sums_i686=('d9b076666905a0ebaa63ae22e45d3c66901dcd0b4bd4e919e86b1e4d7de68bd74eed8fbcfc411dbb6045a57da255781dd53b991252cabc8cf20e674478f5aaa3')
b2sums_aarch64=('ed610fd1c24f0974df5f40ba54842e34fd2bead4b37c73f42ed2326dc2eb1b0e9ee5c003fc7adb7b3a3d5bd193036915729ab62ac0fc530b8f35e90b686cf52b')
b2sums_armv7h=('adccd69295f063a581c14ca024818ecd7c70025ba8e7894f4f8b3367da1b5359885f565b42274c85fe62e273fede3e6e25694a9b0b95ca1eb3257888e9822e1e')

build() {
  cd $srcdir
  # post-install:
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - NB: setup-router overrides listen
  ./nextdns config list | sort > nextdns.conf
}

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
