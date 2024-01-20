# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=getextensions-git
pkgver=1.0.r6.g69c02b6
pkgrel=1
pkgdesc="Python GTK app to install extensions from extensions.gnome.org"
arch=('any')
url="https://github.com/polkaulfield/GetExtensions"
license=('unknown')
depends=('python-gobject' 'python-lxml' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/polkaulfield/GetExtensions.git"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '8e3755f25c9b2726385349609959bf0fa994b27b1a60cd301c7a735fd198d49b')

pkgver() {
  cd GetExtensions
  printf "%s.r%s.g%s" "$(python setup.py --version)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd GetExtensions
  python -m build --wheel --no-isolation
}

package() {
  cd GetExtensions
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
