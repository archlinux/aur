# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>

pkgname=icoextract-git
pkgver=r70.31ce309
pkgrel=1
pkgdesc='Icon extractor for Windows PE files (.exe/.dll) with optional thumbnailer functionality'
arch=('any')
url='https://github.com/jlu5/icoextract'
license=('MIT')
depends=('python-pefile')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pillow: required for the optional thumbnailer')
provides=('exe-thumbnailer')
conflicts=('exe-thumbnailer' 'icoextract')
source=("git+https://github.com/jlu5/icoextract.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/icoextract"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd icoextract

    python -m build --wheel --no-isolation
}

package() {
    cd icoextract

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 exe-thumbnailer.thumbnailer "${pkgdir}"/usr/share/thumbnailers/exe-thumbnailer.thumbnailer

    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/icoextract/LICENSE
}
