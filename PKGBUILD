# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
pkgver=2.5.21.38
pkgrel=1
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_Testing/amd64'
arch=('x86_64')
license=('custom')
depends=('libgpiod' 'ulfius')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source=("$url/meshtasticd_$pkgver~obs1c8eb7e~unstable_amd64.deb")
sha512sums=('7d808198c3017e139d0027077d5056510bdd448638b367263525c31c5a8aacc856832982f4a4c8f966f3cd06298f38b8059abc896227dc269dde257edb3f0be7')

# extract bin from deb file
build() {
  tar -xf "$srcdir/data.tar.xz"
}

package() {
  install -Dm755 "$srcdir/usr/sbin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$srcdir/lib/systemd/system/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  mkdir -p $pkgdir/etc/$_pkgname
  cp -R $srcdir/etc/$_pkgname/* $pkgdir/etc/$_pkgname
}
