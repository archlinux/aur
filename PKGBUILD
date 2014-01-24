# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributors: Frederic Bezies, Ronan Rabouin

_pkgbase=quake2-ctf
pkgname=yamagi-$_pkgbase
pkgver=1.02
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/$_pkgbase-$pkgver.tar.xz"
        "$pkgname.sh" "$pkgname.desktop")
sha256sums=('86ec927da7f05cb6b9e238b3a09f22690ae8dbdb3b73bb2e35d916df6269915f'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            'da8c69eb05eb9aab8526616b2808c7535ae38c1e28b5e7db341ff633bc09be31')

build() {
  cd $_pkgbase-$pkgver

  make
}

package() {
  cd $_pkgbase-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # game library
  install -Dm644 release/game.so "$pkgdir"/usr/share/yamagi-quake2/ctf/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
