#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2021
pkgrel=4
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pacserve"
depends=(pyalpm python3-threaded_servers)
optdepends=('avahi: Avahi support' 'python-dbus: Avahi support' 'python-gobject: Avahi support')
conflicts=(pacredir)
backup=(etc/pacserve/pacserve-ports.conf etc/pacserve/pacserve.service.conf)
source=(
  https://xyne.dev/projects/pacserve/src/pacserve-2021.tar.xz
  https://xyne.dev/projects/pacserve/src/pacserve-2021.tar.xz.sig
)
sha512sums=(
  4bf731c362602dde700caff4db85999ca5a50a46c7a7271e9732c197f3318f0baa6239b349b0d2ace0b0fd91b3c09dc29700f31cd23a1bff51458b9aaad8d1d8
  216853a379e0c605b0db3caca920bcfdf5663740267779e851dcb6caf0c23813d5bf3c3b56059a3ec9c07445126880139a289021c34b8be34ba3f9f3c0506f54
)
md5sums=(
  faf5f7be007f714901811e45278e3f8c
  9833a36ac3f4c79897608308c9e514de
)
install=pacserve.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
