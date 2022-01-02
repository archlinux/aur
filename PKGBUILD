# Maintainer: Dan Yeomans <dan@dyeo.net>

pkgname=scrotre-git
pkgver=0.2.1.r52.03de67c
pkgrel=1
pkgdesc="Screen capture using pygtk, inspired by scrot, forked from escrotum"
arch=('x86_64')
url="https://github.com/dyeo/scrotre"
license=('GPL3')
depends=('python' 'python-cairo' 'python-gobject' 'python-xcffib')
makedepends=('git' 'python-setuptools')
optdepends=('python-numpy: fast image generation'
            'ffmpeg: screen recording')
provides=('scrotre')
source=('git+https://github.com/dyeo/scrotre.git')
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
  install -Dm644 "man/scrotre.1" "$pkgdir/usr/share/man/man1/scrotre.1"
}
