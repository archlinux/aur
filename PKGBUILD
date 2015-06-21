# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=anura-citadel-git
pkgver=0.0.636.gcfe7ea4
pkgrel=1
pkgdesc="A turn based strategy game based on the Anura engine"
arch=(any)
url="https://github.com/davewx7/Citadel"
license=('custom')
depends=(anura-git frogatto-git)
makedepends=('git')
source=(git+https://github.com/davewx7/Citadel.git anura-citadel-git.sh)
md5sums=('SKIP'
         '7cca30cbd18a60c3f96658abb9eacfcd')

_gitname=Citadel

pkgver() {
  cd $_gitname
  if _tag=$(git describe 2>/dev/null)
  then
    # Use the tag of the last commit
    echo $_tag | sed 's|-|.|g'
  else
    # The project currently has no tags yet
    echo 0.0.$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
  fi
}

package() {
  cd $_gitname

  _installdir=$pkgdir/usr/share/anura-git/modules/citadel
  install -DT -m644 module.cfg $_installdir/module.cfg
  cp -r data images sounds evo $_installdir
  install -D -m755 $srcdir/anura-citadel-git.sh $pkgdir/usr/bin/anura-citadel-git
}

# vim:set ts=2 sw=2 et:
