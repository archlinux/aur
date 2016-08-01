#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2016.8
pkgrel=1
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64 armv6h armv6l armv7h armv7l armv8h armv8l)
license=(GPL)
url="http://xyne.archlinux.ca/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.8.tar.xz
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.8.tar.xz.sig
)
sha512sums=(
  6483cca5dd96b5c9868c5020609c71a89771394bd7d2eb02de4431024b74c129fdfc6e2a529baf9ca7f380936be1351f1c9498d3c18f4bfc029d8275cb0d9afc
  46d953004d39f6c97e0cf573db56286d382eb5e7c0db7e6a6d88894e00544c0c70e7ea22c84b767e550e74fc208960a36ad949cbbec552a5aa6d56701da4cfcb
)
md5sums=(
  131347e74757b3fbcfd71fa51ab4bad1
  b9e6bc20fea1e7e9a057b1da56b114ba
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
