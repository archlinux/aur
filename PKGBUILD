## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=ravenna-alsa-daemon
pkgver=1.1.93
pkgrel=5
pkgdesc="A daemon for ALSA RAVENNA/AES67 Driver"
url="https://github.com/bondagit/ravenna-alsa-lkm"
license=("custom")
arch=('x86_64' 'x86_64_v3' 'aarch64')
depends=('glibc' 'avahi' 'ravenna-alsa-lkm-dkms' 'libcurl-compat' 'openssl-1.1')
source=("git+https://github.com/bondagit/ravenna-alsa-lkm.git#branch=aes67-daemon" 'ravenna-alsa.service' 'ravenna_start.sh')
sha256sums=('SKIP'
            '84435eabcfa49ee33c5a9aab1db0aaf0b9245a8d6a7ef59c97be6329a16f59d3'
            '359748b578e06808a4df5d9bc8f64cacfaf7d54025114a0cc83a2af2e65f1bdf')
backup=('opt/ravenna-alsa/merging_ravenna_daemon.conf')

package() {
  install -Dm644 $srcdir/ravenna-alsa-lkm/Butler/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/COPYING
  rm $srcdir/ravenna-alsa-lkm/Butler/LICENSE.md
  install -Dm644 ravenna-alsa.service $pkgdir/usr/lib/systemd/user/ravenna-alsa.service
  install -d $pkgdir/opt/ravenna-alsa
  cp -r $srcdir/ravenna-alsa-lkm/Butler/* $pkgdir/opt/ravenna-alsa/
  install -Dm755 ravenna_start.sh $pkgdir/opt/ravenna-alsa/ravenna_start.sh
  chmod +x $pkgdir/opt/ravenna-alsa/Merging_RAVENNA_Daemon
  chmod 777 $pkgdir/opt/ravenna-alsa/merging_ravenna_daemon.conf
  echo "web_app_path=/opt/ravenna-alsa/webapp/advanced/" >> $pkgdir/opt/ravenna-alsa/merging_ravenna_daemon.conf
}
