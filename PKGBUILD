# Maintainer: Jason King jason@initiateit.com.au
pkgname=python-svc-ttk
pkgver=2.6.4
pkgrel=1
pkgdesc="Sun Valley ttk Crimson theme (sv-ttk variant) for Tkinter/ttk"
arch=('any')
url="https://github.com/initiateit/Sun-Valley-ttk-crimson"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/s/svc-ttk/svc_ttk-${pkgver}.tar.gz")
sha256sums=('86c7e9a09170504389fc25bc79dc4128862357205c1b8f514b09f77d1c649b02')

build() {
  cd "svc_ttk-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "svc_ttk-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License (MIT) – install if present in the sdist
  if [[ -f LICENSE || -f LICENSE.txt || -f LICENSE.md ]]; then
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  fi

  # Docs: install minimal README if included
  if [[ -f README.md ]]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}

