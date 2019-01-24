# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>

_pkgname=arcanist
pkgname=$_pkgname-git
pkgver=6.r1194.g25c23819
pkgrel=1
pkgdesc='The command-line frontend to Phabricator, commonly called arc'
arch=('any')
url="http://phabricator.com"
license=('Apache')
depends=('libphutil-git' 'python')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://secure.phabricator.com/diffusion/ARC/arcanist.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags --always | sed 's/^conduit-//;s/-/.r/;s/-/./'
}

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/" "$pkgdir/usr/bin/"
# do not copy hidden directories
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
  install -Dm644 $_pkgname/resources/shell/bash-completion "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$_pkgname/bin/arc "$pkgdir/usr/bin/arc"
}
