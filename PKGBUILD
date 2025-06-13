# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.12.0
pkgrel=1
pkgdesc='PugJS syntax adapter for Django, Jinja2 and Mako templates'
url='https://github.com/kakulukia/pypugjs'
depends=(python python-six python-charset-normalizer)
optdepends=(python-django python-jinja python-tornado python-mako python-markdown)
makedepends=(python-build python-installer python-setuptools python-wheel ${optdepends[@]})
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=("https://github.com/kakulukia/pypugjs/archive/v$pkgver/pypugjs-$pkgver.tar.gz")
sha256sums=('f3a2efd4f8dd7918b931565259478900883200754d43aaf5e07ce291a573688c')

prepare() {
  cd pypugjs-$pkgver

  # not using upstream pyproject.toml as it pins older dependencies
  rm -v pyproject.toml
}

build() {
  cd pypugjs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pypugjs-$pkgver
  PYTHONPATH="$PWD" pytest pypugjs/testsuite
}

package() {
  cd pypugjs-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
