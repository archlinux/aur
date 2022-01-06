# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=getextensions-git
pkgver=1.0.r4.g01fe032
pkgrel=1
pkgdesc="Python GTK app to install extensions from extensions.gnome.org"
arch=('any')
url="https://github.com/ekistece/GetExtensions"
license=('none')
depends=('python-gobject' 'python-lxml' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ekistece/GetExtensions.git"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '8e3755f25c9b2726385349609959bf0fa994b27b1a60cd301c7a735fd198d49b')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.g%s" "$(python setup.py --version)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
