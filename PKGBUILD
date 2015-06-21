#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=autochown
pkgver=2015
pkgrel=1
pkgdesc='Monitor multiple directories using glob patterns and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/autochown"
makedepends=(cmake rabbit_tree)
backup=(etc/autochownd.conf)
source=(
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2015.tar.xz
  http://xyne.archlinux.ca/projects/autochown/src/autochown-2015.tar.xz.sig
)
sha512sums=(
  6d4cc443cde99ebbd614d25c1df543e9cc0f0212d65c77dd93109ccd5eaf0fd0993260feaf0d74e8ad7f743191e73aaa4980e175d3c8cf2c92c1219c04d1a2c5
  c6c4aca88693f37a0664f0ee81677bafcaea249f80d0ed6be52c1a26cd6ad8794f121fd833b90110eacc52fae8166560bf69a895ab9b3d13abbab38fbb56e9ed
)
md5sums=(
  97a785967a84a02be514aa44e489bc60
  fdce74f14b2900cf22b77af7c565b515
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
