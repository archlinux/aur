#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2021
pkgrel=1
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pacserve"
depends=(pyalpm python3-threaded_servers)
optdepends=('avahi: Avahi support' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
conflicts=(pacredir)
backup=(etc/pacserve/pacserve-ports.conf etc/pacserve/pacserve.service.conf)
source=(
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2021.tar.xz
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2021.tar.xz.sig
)
sha512sums=(
  4bf731c362602dde700caff4db85999ca5a50a46c7a7271e9732c197f3318f0baa6239b349b0d2ace0b0fd91b3c09dc29700f31cd23a1bff51458b9aaad8d1d8
  caf8e3e2c3aec970e2ebf28bc9071dc761896145aeb16c879c2022bbf52aab1436690d2797a19e1e2f2ec72b572d82e47583e4324d24be96a53e544543cfa96d
)
md5sums=(
  faf5f7be007f714901811e45278e3f8c
  340ebe4635547b321b5c66b16d351901
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
