# Maintainer: rafaqzsu <rafaqzsu [at] gmail (dot) com>
pkgname=cropgui-git
pkgver=b3a00e
pkgrel=1
pkgdesc="A GTK GUI for lossless JPEG cropping (and rotating)"
arch=('any')
url="https://emergent.unpythonic.net/01248401946"
license=('GPL')
depends=('python'
         'python2-pillow')
makedepends=('git')
provides=('cropgui')
conflicts=('cropgui')
source=("$pkgname::git+https://github.com/jepler/cropgui")
md5sums=('SKIP')

pkgver() {
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

prepare() {
  cd "${srcdir}"/$pkgname
  git apply ../../python2.patch
}

package() {
  cd "$srcdir/$pkgname"
  ./install.sh -f gtk -t $pkgdir -p /usr -P python2
}
