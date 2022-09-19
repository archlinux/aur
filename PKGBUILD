# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=arcanist
pkgname="${_pkgname}-phorge-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r2351.0c0b9644
pkgrel=1
pkgdesc='The command line interface for Phorge'
arch=('any')
url="https://phorge.it/"
license=('Apache')
depends=('php' 'python')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/phorgeit/arcanist.git")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/" "$pkgdir/usr/bin/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
  ln -s "../share/php/$_pkgname/bin/arc" "$pkgdir/usr/bin/arc"
}
