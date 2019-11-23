# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=ligaturizer-git
appname="${pkgname%-git}"
pkgver=4.r3.gdaa4dc8
pkgrel=1
pkgdesc='FontForge script to add ligatures to any coding font'
arch=(any)
url=https://github.com/ToxicFrog/Ligaturizer
license=(GPL)
groups=()
depends=(fontforge)
optdepends=('otf-fira-code: default font to copy ligatures from')
makedepends=(git)
provides=("$appname")
replaces=()
backup=()
options=()
install=
source=("$appname"::git+https://github.com/ToxicFrog/Ligaturizer.git
        ligaturizer.sh)
noextract=()
md5sums=('SKIP'
         '8aaf3b09e5040c727d9aa2c1eab0b464')

pkgver() {
  cd "$srcdir/$appname"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$appname"
  sed -ie 's#fonts/fira/distr/otf#/usr/share/fonts/OTF#' ligaturize.py
}

package() {
  cd "$srcdir/$appname"
  install -Dm644 ligaturize.py "$pkgdir/usr/share/$appname/ligaturize.py"
  install -Dm644 ligatures.py "$pkgdir/usr/share/$appname/ligatures.py"
  install -Dm755 ../ligaturizer.sh "$pkgdir/usr/bin/ligaturizer"
}
