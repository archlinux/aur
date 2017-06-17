# Maintainer: Artyom Aleksyuk <artyom.h31@gmail.com>

pkgname=noxbit
pkgver=20170618
pkgrel=1
pkgdesc='Live Video Streaming technology based on BitTorrent protocol'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://noxbit.com/'
license=('custom')
options=('!strip')
depends=()
install=noxbit.install
backup=("opt/noxbit/noxbit.cfg")
source=("noxbit.sysusers"
        "noxbit.service")
source_i686=("http://download.noxbit.com/i386/noxbit-pa-x86-i386.tar.gz")
source_x86_64=("http://download.noxbit.com/noxbit-pa-x86-64.tar.gz")
source_arm=("http://download.noxbit.com/ARMel/noxbit-pa-ARMel-32.tar.gz")
source_armv6h=("http://download.noxbit.com/ARMhf/noxbit-pa-ARMhf-32.tar.gz")
source_armv7h=("http://download.noxbit.com/ARMhf/noxbit-pa-ARMhf-32.tar.gz")
source_aarch64=("http://download.noxbit.com/AArch64/noxbit-pa-ARM-64.tar.gz")
sha256sums=('fb84aa86b9bef64365e16efa7090504a03cebb3fd1eb02f3e021114eca3c9070'
            'a9ed99ba5fc696965acbe35803a43637ddff54ce4a09fcb8905d8205d4ea244a')
sha256sums_i686=('SKIP') # Changes too ofter
sha256sums_x86_64=('SKIP')
sha256sums_arm=('SKIP')
sha256sums_armv6h=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  local _source_name=source_$CARCH
  local _date_text=$(curl --silent --head ${!_source_name} | tr -d '\r' | sed -En 's/^Date: (.*)/\1/p')
  date -d"$_date_text" +%Y%m%d
}

package() {
  # Install
  install -dm0755 "$pkgdir"/opt/noxbit
  install -Dm0755 {STM-Agent,STM-Downloader,STM-Hypervisor} "${pkgdir}"/opt/noxbit
  install -Dm0644 noxbit.cfg "${pkgdir}"/opt/noxbit

  # Additional files
  install -Dm0644 "$srcdir"/noxbit.sysusers "$pkgdir"/usr/lib/sysusers.d/noxbit.conf
  install -Dm0644 "$srcdir"/noxbit.service "$pkgdir"/usr/lib/systemd/system/noxbit.service
}