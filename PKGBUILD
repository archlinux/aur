# Maintainer: roger <roger@rogerpc.com.ar>

pkgname=qtile-git
pkgver=2118.c948877
pkgrel=1
pkgdesc="A full-featured, pure-Python tiling window manager. (git version)"
arch=('any')
url="http://www.qtile.org"
license=('MIT')
depends=('python2' 'python2-trollius' 'pango' 'python2-xcffib>=0.2.2' 'python2-cairocffi')
makedepends=('python2-setuptools')
optdepends=('python2-setproctitle: change the process name to qtile')
provides=('qtile')
conflicts=('qtile')
install=${pkgname}.install
source=('git://github.com/qtile/qtile.git')
md5sums=('SKIP')

_gitname="qtile"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  # license
  msg "Copying license..."
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Copying default config..."
  install -D -m 644 $srcdir/$_gitname/libqtile/resources/default_config.py $pkgdir/usr/share/doc/$pkgname/default_config.py

  msg "Copying desktop file..."
  install -D -m 644 $srcdir/$_gitname/resources/qtile.desktop $pkgdir/usr/share/xsessions/qtile.desktop

  # install
  msg "Running setup.py"
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}
