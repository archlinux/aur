#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2020
pkgrel=2
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64 armv6h armv6l armv7h armv7l armv8h armv8l)
license=(GPL)
url="https://xyne.dev/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  https://xyne.dev/projects/autochown/src/autochown-2020.tar.xz
  https://xyne.dev/projects/autochown/src/autochown-2020.tar.xz.sig
)
sha512sums=(
  c9d0efcac6ba1511456e7587b519a9183082a7844a38e2b1604f82eeeda0e23be00ae354cd758bdc9e04dfceb23066dd11be1c4564224149bae739ca9f26c6a1
  f131b5b9a775d55eb4a639435c7d9ce1106e24a59a05fb75216d8d6c7d1e4626cbb38400837b87c119b3d3094075bf529aed8756a9068773eb34ac5c788add1e
)
md5sums=(
  4511eacc6bdf562bc9ed4977c9aceaa8
  dca269ea8441112d57518c26ea8ee27b
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
