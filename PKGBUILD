# Maintainer: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=qtodotxt-git
pkgver=1.4.0.43.g78232b6
pkgrel=1
pkgdesc="A cross-platform UI client for todo.txt files (see todotxt.com)."
arch=('any')
url="https://github.com/mNantern/QTodoTxt"
license=('GPL3')
depends=('python2-pyside')
makedepends=('imagemagick')
optdepends=('todotxt: command line todo.txt')
provides=('qtodotxt')
conflicts=('qtodotxt' 'qtodotxt-hg')
install=$pkgname.install
_gitname=QTodoTxt
source=(
  "git+https://github.com/mNantern/$_gitname"
  qtodotxt.desktop)
md5sums=('SKIP'
         '56774bd2d9895a2f1ea4deee0c5fcf6c')
replaces=('qtodotxt-hg')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/([^-]*-g)/r&/;s/-/./g'
}

build() {
    echo "Applying patches"
    cd "$srcdir/$_gitname"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 bin/qtodotxt $pkgdir/usr/share/qtodotxt/bin/qtodotxt
  cp -pr qtodotxt "$pkgdir/usr/share/qtodotxt/"
  install -Dm644 artwork/icon/qTodo-512.png "${pkgdir}/usr/share/pixmaps/qtodotxt.png"
  install -Dm644 "$startdir/qtodotxt.desktop" "${pkgdir}/usr/share/applications/qtodotxt.desktop"
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/qtodotxt/bin/qtodotxt $pkgdir/usr/bin/qtodotxt
}

# vim:set ts=2 sw=2 et:
