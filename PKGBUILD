# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2
pkgver=5.24
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems"
url="http://www.yamagi.org/quake2/"
arch=('i686' 'x86_64')
license=('custom: Info-ZIP' 'GPL2')
depends=('libjpeg' 'sdl2' 'libxxf86vm' 'libvorbis')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend')
makedepends=('openal' 'mesa')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/quake2-$pkgver.tar.xz"
        "$pkgname.desktop")
sha256sums=('8c468b4fdefa3ae0e6239d677571c38c89387ae52df61a60e0f50bbd26dfa78f'
            '7049a1798e38a263fb2660b94fb70f5154fad1f807259d41649e12cea1a6757c')

build() {
  cd quake2-$pkgver

  make WITH_SYSTEMWIDE=yes WITH_SYSTEMDIR=/usr/share/$pkgname
}

package() {
  cd quake2-$pkgver

  # client + server binaries
  install -Dm755 release/quake2 "$pkgdir"/usr/bin/$pkgname
  install -m755 release/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game library
  install -Dm644 release/baseq2/game.so "$pkgdir"/usr/share/$pkgname/baseq2/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -m644 stuff/yq2.cfg "$pkgdir"/usr/share/doc/$pkgname

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
