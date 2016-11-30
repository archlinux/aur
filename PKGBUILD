# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=antoine
pkgver=2010.10
pkgrel=1
pkgdesc="Nuclear Shell Model Code"
arch=('i686' 'x86_64')
url="http://www.iphc.cnrs.fr/nutheo/code_antoine/intro.html"
license=(custom)
install=$pkgname.install
source=(http://www.iphc.cnrs.fr/nutheo/code_antoine/$pkgname.tar.gz)
md5sums=('34ff4a73a46a555678264f452808e55b')


prepare() {
  cd "$srcdir/$pkgname/source/"

  sed -i 's#\$(HOME)#$(DESTDIR)/usr#g' Makefile_gfortran

  cd "$srcdir/$pkgname/"

  sed -i 's#\$HOME#/usr#g' go
}

package() {
  cd "$srcdir/$pkgname/source/"

  [ -d ${pkgdir}/usr/lib ] || install -d $pkgdir/usr/lib
  [ -d ${pkgdir}/usr/bin ] || install -d $pkgdir/usr/bin

  msg "Installing ANTOINE code antoine.out"
  make DESTDIR="$pkgdir" -f Makefile_gfortran

  [ -d ${pkgdir}/usr/share/$pkgname ] || install -d ${pkgdir}/usr/share/$pkgname
  install -Dm644 $srcdir/$pkgname/go  ${pkgdir}/usr/share/$pkgname

  msg "Installing hamintonian files"
  [ -d ${pkgdir}/usr/share/$pkgname/hamil ] || install -d ${pkgdir}/usr/share/$pkgname/hamil
  install -Dm644 $srcdir/hamil/*  ${pkgdir}/usr/share/$pkgname/hamil

  msg "Installing documentation and examples"
  [ -d ${pkgdir}/usr/share/$pkgname/Exercises ] || install -d ${pkgdir}/usr/share/$pkgname/Exercises
  install -Dm644 $srcdir/Exercises/*  ${pkgdir}/usr/share/$pkgname/Exercises

  [ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 $srcdir/man/man.html ${pkgdir}/usr/share/doc/${pkgname}/

  msg "Installing License"
  [ -d ${pkgdir}/usr/share/licenses/${pkgname} ] || install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 $srcdir/copyright ${pkgdir}/usr/share/licenses/${pkgname}/

}

# vim:set ts=2 sw=2 et:
