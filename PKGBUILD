# Maintainer: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=mythes-tr
pkgver=r77.491563f
pkgrel=1
pkgdesc="Turkish thesaurus"
arch=(any)
url="https://github.com/maidis/$pkgname"
license=('LGPL2.1')

groups=()
depends=()
makedepends=('git')
optdepends=('libmythes: offers thesaurus library functions')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_gitroot="https://github.com/maidis/$pkgname"
_gitname="$pkgname"
source=("$_gitname::git+$_gitroot")

noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {

  cd "$srcdir/$pkgname"
  install -Dm644 th_tr_TR_v2.dat "$pkgdir/usr/share/mythes/th_tr_TR_v2.dat"
  install -Dm644 th_tr_TR_v2.idx "$pkgdir/usr/share/mythes/th_tr_TR_v2.idx"

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd

}

