# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-base
pkgver=0.99.2+481+c9a28525
pkgrel=1
pkgdesc="KAA base package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('python2' 'glib2')
makedepends=('git')
arch=('i686' 'x86_64')
_commit='c9a28525f0ca39546c72f1fd232812d514c631eb'
source=("${pkgname}::git+https://github.com/freevo/kaa-base#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$( grep -m1 VERSION setup.py  | sed "s:.*'\([^']*\)'.*:\1:" )+$(( $( git rev-list --all | grep -B9999  `git rev-list --tags --max-count=1` | wc -l ) - 1))+$( git rev-list --all | head -1 | cut -c1-8 )"
}

package() {
  cd "${srcdir}/${pkgname}"

  # python2 fix
  find . -name '*.py' -exec \
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_;s_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' '{}' \;

  python2 setup.py install --prefix="${pkgdir}"/usr --optimize=1
}
