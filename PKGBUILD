# Contributor: Bug <bug2000@gmail.com>
# Contributor: Loui <louipc.ist@gmail.com>
pkgname=formido
pkgver=1.0.1
pkgrel=4
pkgdesc="Alien killing game using weapons and power-ups"
arch=('i686' 'x86_64')
url="http://www.mhgames.org/oldies/formido/"
license=('GPL')
depends=("sdl_mixer" "sdl_image")
source=("http://noe.falzon.free.fr/prog/$pkgname-$pkgver.tar.gz"
	'formido-music.tar.bz2::http://www.mhgames.org/download.php?formido-music.tar.bz2')
md5sums=('f1556282eddc2edcbfc4fdc62d7b2ba4'
         '8d344651a3bcfd1d809dab1bcec2b7ee')
noextract=(formido-music.tar.bz2)

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make DEFCONFIGDIR=/usr/share/$pkgname DATDIR=/usr/share/$pkgname/data \
    || return 1
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 ${srcdir}/$pkgname-$pkgver/$pkgname ${pkgdir}/usr/bin/$pkgname

  mkdir -p ${pkgdir}/usr/share/$pkgname
  install -m644 ${srcdir}/$pkgname-$pkgver/$pkgname.cfg \
    ${pkgdir}/usr/share/$pkgname/$pkgname.cfg
  cp -R ${srcdir}/$pkgname-$pkgver/data \
  ${pkgdir}/usr/share/$pkgname/data
  tar -xjvf ../formido-music.tar.bz2 -C ${pkgdir}/usr/share/$pkgname/data

  chmod 644 ${pkgdir}/usr/share/formido/data/*
  chown -R 0:0 $startdir
}
