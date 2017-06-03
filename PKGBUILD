# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=arcade-history-dat
pkgver=186
pkgrel=1
pkgdesc="arcade history database file for emulators and frontends with more than 61000 entries"
arch=('any')
url="https://www.arcade-history.com"
license=('custom')
optdepends=('raine: for use in Raine'
            'qmc2: for use in QMC2'
            'sdlmame: for use in MAME')
source=("$url/dats/history$pkgver.7z")
install=$pkgname.install
sha256sums=('747c8934f416c5620babec5068acc23fb251c4915d270cee6d53436e5a009261')

package() {
  install -Dm644 history.dat "$pkgdir"/usr/share/$pkgname/history.dat

  # symlink for use in raine
  install -d "$pkgdir"/usr/share/raine
  ln -s /usr/share/$pkgname/history.dat "$pkgdir"/usr/share/raine/history.dat

  # TODO: where to put it for other emulators/frontends?
  # - MAME needs manual copy/symlink

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  grep '^##' history.dat > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
