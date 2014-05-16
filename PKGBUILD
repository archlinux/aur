pkgname=python2-voidwalker-git
pkgver=0.1.0.73eff8b
_pkgver=0.1.0
pkgrel=1
pkgdesc="A GDB toolbox for low-level debugging"
url="http://github.com/dholm/voidwalker/"
depends=('python2' 'python2-flowui' 'gdb>=7.5')
makedepends=('python2' 'git')
license=('GPLv3')
arch=('any')
source=("voidwalker::git+https://github.com/dholm/voidwalker")
md5sums=('SKIP')

provides=(python2-voidwalker)
conflicts=(python2-voidwalker)

pkgver() {
  cd $srcdir/voidwalker
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  printf "%s.%s" "$_pkgver" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/voidwalker
    python2 setup.py build
}

package() {
    cd $srcdir/voidwalker
    python2 setup.py install --root="$pkgdir" --optimize=1
}
