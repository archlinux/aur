#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2018
pkgrel=1
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64 armv6h armv6l armv7h armv7l armv8h armv8l)
license=(GPL)
url="https://xyne.archlinux.ca/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  https://xyne.archlinux.ca/projects/autochown/src/autochown-2018.tar.xz
  https://xyne.archlinux.ca/projects/autochown/src/autochown-2018.tar.xz.sig
)
sha512sums=(
  a0a4531b2b8438e477e07dbb423be21d9f512f54a87fd867879aea4ac0a3f2ea543f5daa4fb2dc6f4483cecab61a08547d02eed370fd1e6a7f689edd76de52b2
  30ce935b97af695cd1174a5ebfb3df9d4774ec0d3a34ca23f07f65eb1280b39d92918400f12df198f3c9ba7aeca8c5bf46c8405453e93678a80e99abfb2c45bb
)
md5sums=(
  ed69f0e706b5ed0e9e171e1b0edbe958
  c7c3d6b242dceb6a30934933495deb8f
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  mkdir -p "$srcdir/build"
  rm -fr "$srcdir/build/"*
  cd -- "$srcdir/build"
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package ()
{
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "${pkgname}d.conf" "${pkgdir}/etc/${pkgname}d.conf"
  install -Dm644 "man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  cd -- "$srcdir/build"
  make install DESTDIR="$pkgdir"
}


# vim: set ts=2 sw=2 et:
