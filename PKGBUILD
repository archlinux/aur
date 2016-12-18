# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=doomrl-git
pkgver=r8.0cbac80
pkgrel=1
pkgdesc="Doom: The Rogue-like (git-latest) (WIP!)."
arch=(any)
url="https://github.com/ChaosForge/doomrl"
license=('GPL3')
depends=('')
makedepends=('git' 'fpc-svn')
source=("$pkgname::git+https://github.com/ChaosForge/doomrl"
	"fpcvalkyrie::git+https://github.com/ChaosForge/fpcvalkyrie"
	)
sha256sums=('SKIP'
	    'SKIP'
	    )

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{


  # fpcvalkyrie is harcoded from Makefile to look a level up
  # from doomrl/makeifle.lua ...
  cp -r $srcdir/fpcvalkyrie $pkgname

  cd $srcdir/$pkgname
  rm -r tmp && mkdir tmp
  lua makefile.lua hq

}

package() {

	msg2 "Installing configuration files..."
	install -m777 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
