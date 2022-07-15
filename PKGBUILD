#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2022.7
pkgrel=3
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64 armv6h armv6l armv7h armv7l armv8h armv8l)
license=(GPL)
url="https://xyne.dev/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  https://xyne.dev/projects/autochown/src/autochown-2022.7.tar.xz
  https://xyne.dev/projects/autochown/src/autochown-2022.7.tar.xz.sig
)
sha512sums=(
  7e4aa477657727fb0bc86f02bcfb6dffc7e3522d6bae037fa9483468f059fd98d6475d203dfcc06dd107afa78b2978fac3adfc9998a670f6f39bf3fdfc13f532
  1bbb5800277096f794188abf13b1d6bb1136d11e95dafb927b25c1ada1553123652ce6d5aa1202f42e4aab5dbcc4357e4a169695e3a349f768c0a8457ec868d0
)
md5sums=(
  f82556fb057096762dd96584ba831d86
  314fa5586a7fe2db7bcf852fc2221c6a
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
