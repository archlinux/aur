#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacserve
pkgver=2020
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
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2020.tar.xz
  https://xyne.archlinux.ca/projects/pacserve/src/pacserve-2020.tar.xz.sig
)
sha512sums=(
  239f3611a897ae949390188d52d5783a34b9303407bb0a21420744094e3b7955ac2d1e739a578651781a59a80993a4c74c8ae07288fb52020a5404ec91ddda5e
  cbd3766878e29c718c3c616e8ea958013bae77b189354c2b262c87ca286d9cbe12615f6b0660bce5d3c14bcf7dd9e73daee9947fa2920da76b03c2cb2b951757
)
md5sums=(
  7d077a804d369ca6400cd5249b705e32
  55093efeb66a13ae9187624cf006461d
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
