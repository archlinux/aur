#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2016
pkgrel=1
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.tar.xz
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2016.tar.xz.sig
)
sha512sums=(
  bc13f3b582bf594abeff88608b395d7c7049102c04bd98bd1a6365fcd29b578ce2cf121156157d22059df144d60fa0232406a8684b8e6360adb396076db3fd68
  145f1a21a98c37adc08565a1318749ca1e54c5cb84a9192b616b53938604c77a79f5aba170007dac450588bcf6309d129c63a9546f82c4c0af17c1933c008fe8
)
md5sums=(
  fd3aec154e6f4d47eceace405f2a2403
  eb71bbd9838bf7d054656bb6f3217e05
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
