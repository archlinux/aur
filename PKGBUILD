# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: roger <roger@rogerpc.com.ar>

pkgname=qtile-de-vri-es-git
pkgver=2597.832b7b8
pkgrel=3
pkgdesc="A full-featured, pure-Python tiling window manager. (git version from de-vri-es)"
arch=('any')
url="http://www.qtile.org"
license=('MIT')
depends=('python' 'pango' 'python-xcffib' 'python-cairocffi')
makedepends=('python-setuptools')
optdepends=('python-setproctitle: change the process name to qtile')
provides=('qtile')
conflicts=('qtile')
source=('git+https://github.com/de-vri-es/qtile')
md5sums=('SKIP')

_gitname="qtile"

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  # license
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m 644 $srcdir/$_gitname/libqtile/resources/default_config.py $pkgdir/usr/share/doc/$pkgname/default_config.py

  install -D -m 644 $srcdir/$_gitname/resources/qtile.desktop $pkgdir/usr/share/xsessions/qtile.desktop

  python setup.py install --root=${pkgdir} --prefix=/usr
}
