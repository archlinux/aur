# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>

pkgname=ksmtuned-git
pkgver=14.48f3d5b
pkgrel=2
pkgdesc='While the ksm service is only able to start and stop the KSM kernel thread, ksmtuned controls and tunes KSM according to the used memory of running qemu KVM instances.'
arch=('any')
license=('GPLv2')
url='https://git.centos.org/summary/rpms!qemu-kvm'
provides=('ksmtuned')
conflict=('ksmtuned')
source=('git://github.com/Anthony25/ksmtuned.git')
md5sums=('SKIP')
backup=('etc/default/ksm' 'etc/ksmtuned.conf')

_gitname="ksmtuned"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  make build

  install -D -m 644 ksm $pkgdir/etc/default/ksm
  install -D -m 644 ksmtuned.conf $pkgdir/etc/ksmtuned.conf

  install -D -m 755 ksmctl $pkgdir/usr/bin/ksmctl
  install -D -m 755 ksmtuned $pkgdir/usr/bin/ksmtuned

  install -D -m 644 ksm.service $pkgdir/usr/lib/systemd/system/ksm.service
  install -D -m 644 ksmtuned.service $pkgdir/usr/lib/systemd/system/ksmtuned.service
}
