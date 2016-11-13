#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2016.11
pkgrel=1
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64 armv6h armv6l armv7h armv7l armv8h armv8l)
license=(GPL)
url="http://xyne.archlinux.ca/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.11.tar.xz
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.11.tar.xz.sig
)
sha512sums=(
  a64b3c2cba4fdc666003aeae8eee0708434a258480513200a2a1d2beaf775f86b0c0f1bb4e1c21948c4bdfd3462305c128bddc476ae1b9711dccdb4e85133545
  e093dd64b14db8e494782ac493ccc92d8dad5e47253f7a9130f4a2769091285021903b9e79924d3fa9ae477a4a8eab5e34968d813591ffcb9f16620dbee0c52d
)
md5sums=(
  bb141e3e235a10157bb937876aa3006f
  d02162247cf38754c395d3cdf2117d92
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
