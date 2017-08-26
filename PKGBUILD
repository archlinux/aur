# Maintainer: M0Rf30

pkgname=assaultcube-reloaded-git
pkgver=717.dddd73b
pkgrel=1
pkgdesc='AssaultCube Reloaded (Development)'
arch=('i686' 'x86_64')
url='http://acr.victorz.ca'
license=('ZLIB')
depends=('curl' 'gcc-libs' 'libgl' 'libvorbis' 'libx11' 'openal' 'sdl' 'sdl_image' 'zlib')
makedepends=('git')
conflicts=('assaultcube-reloaded')
replaces=('assaultcube-reloaded')
source=("git+https://github.com/acreloaded/acr.git"
        'acreloaded'
        'acreloaded-server'
        'acreloaded.desktop'
        'acreloaded.svg'
)
pkgver() {
  cd $srcdir/acr
  echo $(git rev-list --count master).$(git rev-parse --short master)
}


package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/acreloaded  
  cd $srcdir/acr
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
}

md5sums=('SKIP'
         'c6db5816ce66282f6d6c7d08792b6095'
         '53b17712afb7f0a5646b9894032d06ff'
         'bff621e554812c7325b2bd7f56e9e881'
         '3b142417157d73da4a7981fd07bcb628')
