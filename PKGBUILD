# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
pkgver=2.6.4.16
pkgrel=1
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_Testing/amd64'
arch=('x86_64')
license=('custom')
depends=('libgpiod' 'ulfius')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source=("$url/meshtasticd_$pkgver~obsb89355f~beta_amd64.deb")
sha512sums=('62a01d51d08aaa6d6fcd2a29c38197a106d1b5908198faac69dbd9cf84e23b3b3a1474896266d220820fc402359f39cef0cadf4294d0728fdd1761ede2eccd26')

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
