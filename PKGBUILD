# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=doomrl-git
pkgver=r8.0cbac80
pkgrel=3
pkgdesc="Doom: The Rogue-like (git-latest) (WIP!)."
arch=(any)
url="http://drl.chaosforge.org/"
license=('GPL3')
depends=('sdl_mixer' 'zlib' 'lua' 'timidity++' 'sdl_image')
makedepends=('git' 'fpc-svn' 'lua')
source=("$pkgname::git+https://github.com/ChaosForge/doomrl"
	"fpcvalkyrie::git+https://github.com/ChaosForge/fpcvalkyrie"
	)
sha256sums=('SKIP'
	    'SKIP'
	    )

prepare()
{

  # fpcvalkyrie is harcoded from Makefile to look a level up
  # from doomrl/makeifle.lua ...
  cp -r $srcdir/fpcvalkyrie $srcdir/$pkgname

}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{

  cd $srcdir/$pkgname
  rm -rf tmp && mkdir tmp
  lua makefile.lua hq

}

package() {

	msg2 "Installing configuration files..."
	# TODO

}
