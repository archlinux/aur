#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2017
pkgrel=2
pkgdesc='Easily share Pacman packages between computers. A replacement for PkgD.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pacserve"
depends=(pyalpm python3-threaded_servers)
backup=(etc/pacserve/pacserve-ports.conf etc/pacserve/pacserve.service.conf)
source=(
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2017.tar.xz
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2017.tar.xz.sig
)
sha512sums=(
  a2bbfcec8d61f3d84c890370d5b4ace887e412940b2b435d1e4e9263ceecd0b96da1554124cb0471d1f52e3985da2b32cdcbe73d6f11ded26773ca6d8a158c39
  854de5bd367caf7adbf6e9828c473c3688bdaa14211cf8ca7f231e3f46d426d9d4d059bcee49ac59a56eccb166be650a7e88e80dee146a1c72caced7b9e45d31
)
md5sums=(
  9c7587a93dc451d807fbcd1fabf08e7f
  4350ca4f6a48c67c40263efed7ab93bc
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
