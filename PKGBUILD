# Maintainer: robertfoster

pkgname=assaultcube-reloaded-git
pkgver=760.6cffc51
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
  cd source/src

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

sha256sums=('SKIP'
            'a37ec630f0702efc04318b0bccf97da40e6573c0793bc9ecf5e1496435f5a5b2'
            '393d333f37d8a8677796c60cbfa8cc5e3ea17a2323b0082acf47c42d99f7f491'
            'a1e3b84ed6130a01afb52abd894d8a9175b2a09b574cb24962c9866dc48f58d3'
            'aeb6b8028181e791a43c1885fb88f04498237a15bdb6da767caa4c8ab8065234')
