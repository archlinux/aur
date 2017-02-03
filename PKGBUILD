# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fslint
pkgver=2.46
pkgrel=1
pkgdesc="A utility to find and clean various forms of lint on a filesystem"
arch=('any')
url="http://www.pixelbeat.org/fslint/"
license=('GPL')
depends=('pygtk' 'python2')
source=(http://www.pixelbeat.org/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('f15daebfecfd2eea0d3b48a0193e25974b71dcf1e4b4a33d5a3dcfb7bb9c90cc')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i -e s_^liblocation=.*_liblocation=\'/usr/share/fslint\'_ fslint-gui
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/{man/man1,doc/$pkgname,pixmaps}
  install -d "${pkgdir}"/usr/share/$pkgname/fslint/{fstool,supprt/rmlint}

  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname $pkgname/find* $pkgname/zipdir $pkgname/fslint
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/fstool $pkgname/fstool/*
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt $pkgname/supprt/get* $pkgname/supprt/fslver $pkgname/supprt/md5sum_approx
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt/rmlint fslint/supprt/rmlint/*
  install -D -m755 $pkgname-gui "${pkgdir}"/usr/bin/$pkgname-gui
  install -D -m644 $pkgname.glade "${pkgdir}"/usr/share/$pkgname/$pkgname.glade
  install -D -m644 $pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 fslint_icon.png "${pkgdir}"/usr/share/$pkgname/fslint_icon.png
  ln -s /usr/share/$pkgname/fslint_icon.png "${pkgdir}"/usr/share/pixmaps/fslint_icon.png

  cp -r "${srcdir}"/$pkgname-$pkgver/man/* "${pkgdir}"/usr/share/man/man1
  cp -r "${srcdir}"/$pkgname-$pkgver/doc/* "${pkgdir}"/usr/share/doc/$pkgname

  make -C po DESTDIR="${pkgdir}" install
}
