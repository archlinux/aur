# Maintainer: Husam Bilal <me@husam.dev>
# Contributor: Doug Newgard <scimmia@archlinux.info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=arcanist
pkgname="${_pkgname}-stable"
pkgver=conduit.5.r1649.gbac20284
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('libphutil' 'php' 'python')
optdepends=('git: Git VCS support' 'subversion: Subversion VCS support' 'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/phacility/arcanist.git#branch=stable')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/" "$pkgdir/usr/bin/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
  install -Dm644 "$_pkgname/resources/shell/bash-completion" "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s "../share/php/$_pkgname/bin/arc" "$pkgdir/usr/bin/arc"
}
