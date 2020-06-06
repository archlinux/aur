# Maintainer: roger <roger@rogerpc.com.ar>
# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=escrotum-git
pkgver=0.2.1.r46.27dfa4e
pkgrel=1
pkgdesc="Screen capture using pygtk, inspired by scrot"
arch=('x86_64')
url="https://github.com/Roger/escrotum"
license=('GPL3')
depends=('python' 'python-cairo' 'python-gobject' 'python-xcffib')
makedepends=('git' 'python-setuptools')
optdepends=('python-numpy: fast image generation'
            'ffmpeg: screen recording')
provides=('escrotum')
source=('git+https://github.com/Roger/escrotum.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "man/escrotum.1" "$pkgdir/usr/share/man/man1/escrotum.1"
}
