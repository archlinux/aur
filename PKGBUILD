# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=argentum-age-git
pkgver=0.0.1853.g5a4ccf1
pkgrel=1
pkgdesc="A digital collectible card game with tactical elements."
arch=(any)
url='http://argentum-age.com/'
license=('custom')
depends=(anura-git)
provides=(argentum-age anura-citadel-git)
conflicts=(argentum-age anura-citadel-git)
makedepends=('git')
source=(git+https://github.com/davewx7/citadel.git
        argentum-age-git.sh)
md5sums=('SKIP'
         'ad03a90e4ee6019c28e91fa89d5c689c')

_gitname=citadel

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
  cd "$_gitname"

  _installdir="$pkgdir/usr/share/anura-git/modules/argentum-age"
  install -DT -m644 module.cfg "$_installdir/module.cfg"
  install -DT -m644 master-config.cfg "$_installdir/master-config.cfg"
  mv data images sounds music "$_installdir"
  install -D -m755 "$srcdir/argentum-age-git.sh" "$pkgdir/usr/bin/argentum-age-git"
  install -DT -m644 LICENSE "$pkgdir/usr/share/licenses/argentum-age-git/LICENSE"
}

# vim:set ts=2 sw=2 et:
