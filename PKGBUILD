# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cdir-git
pkgver=1.3.r48.a2e4ad8
pkgrel=3
pkgdesc="A faster way to navigate folders and browse files in Windows and Linux shells."
arch=('any')
url="https://github.com/EskelinenAntti/cdir"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/EskelinenAntti/cdir.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "$(python setup.py --version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
