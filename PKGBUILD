# Originator: mitsuse <mitsuset at gmail>
# Contributor: tychoish <sam at tychoish com>
# Maintainer: Theo J.A. de Vries <t.j.a.devries(at)gmail(dot)com>

_gitname='hieroglyph'

pkgname=python-$_gitname-git
pkgver=0.7.1.r11.g6861328
pkgrel=1
pkgdesc="hieroglyph is an extension for Sphinx which builds HTML5 slides from ReStructured Text documents."
arch=("any")
url="http://yergler.net/projects/hieroglyph/"
license=("BSD")
depends=("python" "python-sphinx")
makedepends=("python-distribute" "git")
provides=("python-hieroglyph")
conflicts=("python-hieroglyph" )
source=('git://github.com/nyergler/hieroglyph.git')
md5sums=('SKIP')

prepare() {
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  msg "Applying patch"
  sed -i "s/print 'Compiled %s slides.' % len(md_slides)/print('Compiled %s slides.' % len(md_slides))/g" $srcdir/$_gitname-build/src/hieroglyph/themes/slides2/static/scripts/md/render.py
}

package() {
    cd ${srcdir}/$_gitname-build/
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ${srcdir}/$_gitname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
