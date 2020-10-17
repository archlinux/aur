# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=git-subrepo-xdg
pkgver=0.4.1
pkgrel=1
pkgdesc="Git Submodule alternative"
arch=('any')
url="https://github.com/ingydotnet/git-subrepo"
license=('MIT')
depends=('git')
makedepends=(gzip sed)
provides=("git-subrepo")
conflicts=("git-subrepo")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('64cc2490c54fe1e5396bb14f6bbf0aa8378085f3b8847fd8ed171e5ddd886065')

package() {
  sed -i '7 i BASH_SOURCE=/usr/bin' $srcdir/git-subrepo-${pkgver}/lib/git-subrepo
  sed -i '20 i SOURCE_DIR=/usr/lib/git-subrepo' $srcdir/git-subrepo-${pkgver}/lib/git-subrepo

  install -Dt $pkgdir/usr/bin/ $srcdir/git-subrepo-${pkgver}/lib/git-subrepo

  install -d $pkgdir/usr/lib/git-subrepo
  cp -a $srcdir/git-subrepo-${pkgver}/lib/git-subrepo.d $pkgdir/usr/lib/git-subrepo

  # TODO (maybe): package bashplus separately (https://github.com/ingydotnet/bashplus)
  rm $pkgdir/usr/lib/git-subrepo/git-subrepo.d/bash+.bash
  cp -a $srcdir/git-subrepo-${pkgver}/ext/bashplus/lib/bash+.bash $pkgdir/usr/lib/git-subrepo/git-subrepo.d/

  install -d $pkgdir/usr/share/man/man1
  gzip -c $srcdir/git-subrepo-${pkgver}/man/man1/git-subrepo.1 > $pkgdir/usr/share/man/man1/git-subrepo.1.gz

  # TODO: completions
}

