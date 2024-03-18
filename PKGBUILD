# Maintainer: Dan Cecile

gamename=ultra-rainbow-bake-sale
pkgname=$gamename-git
pkgver=0.1.41
pkgrel=1
pkgdesc="A singleplayer, deck-building, baking game."
arch=('any')
url="https://dcecile.itch.io/ultra-rainbow-bake-sale"
license=('MIT')
depends=('love10')
makedepends=('python' 'git')
source=($pkgname::git+https://github.com/dcecile/$gamename.git)
sha1sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule update
  ./fetchDependencies.py
}

pkgver() {
  cd "$pkgname"
  ./versionNumber.py
}

build() {
  cd "$pkgname"
  ./package.py
  echo -e "#!/bin/sh\nexec love10 /usr/share/$pkgname/$gamename.love" > $pkgname.sh
}

package() {
  cd "$pkgname"
  install -Dm0644 $gamename.love "$pkgdir"/usr/share/$pkgname/$gamename.love
  install -Dm0644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  install -Dm0755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
