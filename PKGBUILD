# Maintainer: Dimitri Kaparis <kaparis.dimitri@gmail.com>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=qtodotxt-git
pkgver=1.4.0
pkgrel=2
pkgdesc="A cross-platform UI client for todo.txt files (see todotxt.com)."
arch=('any')
url="https://github.com/mNantern/QTodoTxt"
license=('GPL3')
depends=('python-pyside')
makedepends=('git')
provides=('qtodotxt')
conflicts=('qtodotxt' 'qtodotxt-hg')
_gitname=QTodoTxt
source=("git+https://github.com/mNantern/$_gitname")
md5sums=('SKIP')
replaces=('qtodotxt-hg')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/([^-]*-g)/r&/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 bin/qtodotxt $pkgdir/usr/share/qtodotxt/bin/qtodotxt
  cp -pr qtodotxt "$pkgdir/usr/share/qtodotxt/"
  install -Dm644 artwork/icon/qTodo-512.png "${pkgdir}/usr/share/qtodotxt/artwork/icon/icon512.png"
  install -Dm644 packaging/Debian/qtodotxt.desktop "${pkgdir}/usr/share/applications/qtodotxt.desktop"
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/qtodotxt/bin/qtodotxt $pkgdir/usr/bin/qtodotxt
}
