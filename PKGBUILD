# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=capbattleship-git
pkgver=v1.0alpha2.r3.gb771f89
pkgrel=1
pkgdesc="A pirate-themed battleship game"
arch=('any')
url="https://forge.tedomum.net/captnfab/capbattleship"
license=('MIT')
makedepends=('git')
depends=('python-pygame')
conflicts=('capbattleship')
provides=('capbattleship')
source=("git+https://forge.tedomum.net/captnfab/capbattleship.git"
        "capbattleship.desktop")
sha384sums=('SKIP'
            '8ae97f48e815cd1ed8c45716cd315046063f147760439367a65b9a774976b36bb968a44d48159c5a6c7028f15d2bfb13')

pkgver() {
  cd capbattleship
  git describe --tags --long | sed 's/^nbxmpp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd capbattleship
  python setup.py build
}

package() {
  cd capbattleship
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Otherwise the game doesn’t start.
  mv "$pkgdir"/usr/bin/capbattleship.py "$pkgdir"/usr/bin/capbattleship

  install -Dm644 assets/gfx/icon_256px.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/capbattleship.png
  install -Dm644 ../capbattleship.desktop "$pkgdir"/usr/share/applications/capbattleship.desktop
}
