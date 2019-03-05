## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=ravenna-alsa-daemon
pkgver=1.1
pkgrel=1
pkgdesc="A daemon for ALSA RAVENNA/AES67 Driver"
url="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm"
license=("custom")
arch=('x86_64')
depends=('glibc' 'avahi' 'ravenna-alsa-lkm-dkms')
source=("git+https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm.git" 'ravenna-alsa.service' 'merging_ravenna_daemon.conf' 'ravenna_start.sh')
sha256sums=('SKIP'
            'cb8a2a9a19828c211b69c91752b65dece52302ccff4e051408e24ba4aa66c4b9'
            '87b5aeae3de90122a0c85458f8e597e6c3d365e7aff91c8c441c978623144de9'
            '359748b578e06808a4df5d9bc8f64cacfaf7d54025114a0cc83a2af2e65f1bdf')

package() {
  install -Dm644 $srcdir/ravenna-alsa-lkm/Butler/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/COPYING
  rm $srcdir/ravenna-alsa-lkm/Butler/LICENSE.md
  install -Dm644 ravenna-alsa.service $pkgdir/usr/lib/systemd/user/ravenna-alsa.service
  install -d $pkgdir/opt/ravenna-alsa
  cp -r $srcdir/ravenna-alsa-lkm/Butler/* $pkgdir/opt/ravenna-alsa/
  cp $pkgdir/opt/ravenna-alsa/merging_ravenna_daemon.conf $pkgdir/opt/ravenna-alsa/merging_ravenna_daemon.conf.bak
  cp merging_ravenna_daemon.conf $pkgdir/opt/ravenna-alsa/merging_ravenna_daemon.conf
  install -Dm755 ravenna_start.sh $pkgdir/opt/ravenna-alsa/ravenna_start.sh
  chmod +x $pkgdir/opt/ravenna-alsa/Merging_RAVENNA_Daemon
}
