#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2018
pkgrel=11
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pacserve"
depends=(pyalpm python3-threaded_servers)
optdepends=('avahi: Avahi support' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
conflicts=(pacredir)
backup=(etc/pacserve/pacserve-ports.conf etc/pacserve/pacserve.service.conf)
source=(
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2018.tar.xz
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2018.tar.xz.sig
)
sha512sums=(
  1094216551c3272cbd9b08f5570e4c923b5babdd4ec2e5d29ae829d42288bcd12eeffdd42d30d6da41f91ac2ef88b0ef89f79c4d1e10dffb8cdb2118908163eb
  5142917a1fab2d5777ed78a7ca99e802584844a398072f9c6a2646dbddad65e1b08c3c538989757b9fc27f82c4052a7ce676a309ed94c161dcac67c390058ffb
)
md5sums=(
  f7e3684844f88e41a21591bffba9e887
  08e88378b73158a179dac5d898c62591
)
install=pacserve.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"


  for foo_ in etc/*/*
  do
    install -Dm644 "$foo_" "$pkgdir/$foo_"
  done

  for bin_ in bin/*
  do
    install -Dm755 "$bin_" "$pkgdir/usr/bin/${bin_##*/}"
  done

  for service_ in systemd/*.service
  do
    install -Dm644 "$service_" "$pkgdir/usr/lib/systemd/system/${service_##*/}"
  done

  echo 'u pacserve - "Pacserve daemon" /etc/pacserve' |
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim: set ts=2 sw=2 et:
