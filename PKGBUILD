# Maintainer: M0Rf30

pkgname=assaultcube-reloaded
pkgver=2.6.3
pkgrel=2
pkgdesc='AssaultCube Reloaded'
arch=('i686' 'x86_64')
url='http://acr.victorz.ca'
license=('ZLIB')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'openal' 'zlib' 'gcc-libs' 'libgl' 'enet' 'libvorbis' 'libx11' 'glu')
makedepends=('git' )
source=("https://github.com/actf/acr/archive/v${pkgver}.tar.gz"
        'acreloaded'
        'acreloaded-server'
        'acreloaded.desktop'
        'acreloaded.svg'
	dde2726796d8cfc4e2ad9793b045182f1a1ec082.patch)

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/acreloaded  
  cd ${srcdir}/acr-${pkgver}
  patch -Np1 -i ../dde2726796d8cfc4e2ad9793b045182f1a1ec082.patch
  cd  source/src

  make DESTDIR=$pkgdir install
  cd ../..

  cp -rf bot config packages acr/packages ${pkgdir}/usr/share/acreloaded

  install -Dm755 bin_unix/native_client ${pkgdir}/usr/share/acreloaded/native_client
  install -Dm755 bin_unix/native_server ${pkgdir}/usr/share/acreloaded/native_server
  install -Dm644 ${srcdir}/acreloaded.svg ${pkgdir}/usr/share/pixmaps/acreloaded.svg
  install -Dm644 ${srcdir}/acreloaded.desktop ${pkgdir}/usr/share/applications/acreloaded.desktop
  install -Dm755 ${srcdir}/acreloaded ${pkgdir}/usr/bin/acreloaded
  install -Dm755 ${srcdir}/acreloaded-server ${pkgdir}/usr/bin/acreloaded-server

  
#msg "Checkout Languages"
#  cd $srcdir
#  rm -r translations/.git
#  cp -r translations/* $pkgdir/usr/share/acreloaded/locale/
}

md5sums=('260e71aa128710012a94e53fdde61286'
         'c6db5816ce66282f6d6c7d08792b6095'
         '53b17712afb7f0a5646b9894032d06ff'
         'bff621e554812c7325b2bd7f56e9e881'
         '3b142417157d73da4a7981fd07bcb628'
         '45a0c9247df6cd6547ee9f90ff181024')
