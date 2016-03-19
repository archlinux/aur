# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=conlie
pkgver=2.2.2
pkgrel=3
pkgdesc="A Computer algebra package for Lie group computations (Compile only version)"
arch=('i686' 'x86_64')
url="http://www-math.univ-poitiers.fr/~maavl/LiE/"
license=('LGPL')
depends=('sh')
provides=('lie')
source=("http://www-math.univ-poitiers.fr/~maavl/LiE/conLiE.tar.gz" "http://wwwmathlabo.univ-poitiers.fr/~maavl/LiEman/manual.pdf" 'lie' 'lie.1')
md5sums=('2e98f252364d43557a322ea7eb677944'
         '671f912a866faac09d35f549a59d8338'
         '469db0e6965f301286ddd052b2cfe96d'
         'a47060395617ed656eaccde1a9e9ee93')

build() {
  cd LiE

  make
}

package() {
  cd LiE

  install -D Lie.exe $pkgdir/usr/bin/Lie.exe
  install -D $srcdir/lie $pkgdir/usr/bin/lie

  mkdir -p $pkgdir/usr/lib/lie
  for i in INFO.* LEARN.ind
  do
      cp $i $pkgdir/usr/lib/lie/
  done

  install -D manual/manual.dvi $pkgdir/usr/share/doc/lie/manual.dvi
  install -D ../manual.pdf $pkgdir/usr/share/doc/lie/manual.pdf
  install -D README $pkgdir/usr/share/doc/lie-2.2.2/README

  install -D $srcdir/lie.1 $pkgdir/usr/share/man/man1/lie.1
}
