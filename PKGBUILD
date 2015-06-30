# Maintainer: roger <roger@rogerpc.com.ar>

pkgname=qtile-python3-git
pkgver=1998.9713e17
pkgrel=2
pkgdesc="Python3 full-featured, pure-Python tiling window manager. (git version)"
arch=('any')
url="http://www.qtile.org"
license=('MIT')
depends=('python' 'pango' 'python-xcffib>=0.1.10' 'python-cairocffi')
makedepends=('python-setuptools' 'git')
optdepends=('python-setproctitle: change the process name to qtile')
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
  python setup.py install --root=${pkgdir} --prefix=/usr
}
