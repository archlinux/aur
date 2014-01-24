# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

_pkgbase=quake2-xatrix
pkgname=yamagi-$_pkgbase
pkgver=2.00
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/$_pkgbase-$pkgver.tar.xz"
        "$pkgname.sh" "$pkgname.desktop")
sha256sums=('11b8d9eb8ae98e7fa15946d28edb87d5d571c8a51a515d5bc50db13837cb0f10'
            '7c60d4bd78a528f5cf08425cfdcb87dacf574d3912c44439e623e35f37fbc972'
            '8f13e4f6afc9e60fa7d52856397d03a8ed5b87418cea6e0281d083a5573b3647')

build() {
  cd $_pkgbase-$pkgver

  make
}

package() {
  cd $_pkgbase-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # game library
  install -Dm644 release/game.so "$pkgdir"/usr/share/yamagi-quake2/xatrix/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
