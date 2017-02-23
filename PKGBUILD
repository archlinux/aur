# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=('cutelyst-tutorial-git')
pkgver=1.0.0
pkgrel=1
pkgdesc="The Wiki tutorial from Github as a local copy"
arch=('any')
url="http://cutelyst.org"
license=('LGPL2.1')
makedepends=('python2')
source=('git+https://github.com/cutelyst/cutelyst.wiki.git')
md5sums=('SKIP')
_git_name='cutelyst.wiki'

build() {
  test ! -d html && mkdir html
  for md in ${_git_name}/Tut*.md; do
    echo -n "$md..."
    python2 ../proc_tut.py $md html/$(basename $md .md).html
    echo " done"
  done
}

package() {
  cd $startdir
  local t=usr/share/doc/cutelyst/tutorial
  install -d -m755 ${pkgdir}/$t/
  install -m644 ${srcdir}/html/* ${pkgdir}/$t/
  install -m644 default.css ${pkgdir}/$t/
}
