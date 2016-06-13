# Contributor: masutu <masutu dot atch at gmail dot com>
# Contributor: Jonathan Fine <were.Vire@gmail.com>
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=glnemo2
pkgver=1.10.0
pkgrel=1
pkgdesc="an interactive visualization 3D program for nbody snapshots."
arch=('i686' 'x86_64')
url="http://projets.oamp.fr/projects/glnemo2"
license=('GPL')
depends=('glu' 'qt5-base' 'ccfits' 'hdf5-cpp-fortran')
source=(http://projets.lam.fr/attachments/download/2892/${pkgname}-${pkgver}.tar.gz)
md5sums=('d012fc4d0ca59275641e2de15ec499b4')
noextract=( ${source[@]##*/} )

build() {
  #work around strange bsdtar errors
  cd $srcdir
  tar xfs $pkgname-$pkgver.tar.gz

  cd $pkgname
  sed -i 's/\-g/-O3/' config.arch
  sed -i 's/^COMPILEMODE          = debug/#COMPILEMODE          = debug/' config.arch
  sed -i 's/^#COMPILEMODE          = release/COMPILEMODE          = release/' config.arch
  qmake-qt5 -recursive
  make
}

package() {
  # cd $srcdir/$pkgname

  cd $pkgname
  install -D -m755 bin/unix/release/glnemo2 $pkgdir/usr/bin/glnemo2
  install -D -m644 man/man1/glnemo2.1 $pkgdir/usr/share/man/man1/glnemo2.1
}

# vim:set ts=2 sw=2 et:

