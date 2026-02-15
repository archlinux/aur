# Maintainer: Nirakar Jena <jenanirakar60@gmail.com>
pkgname=loglens
pkgver=1.1.0
pkgrel=1
pkgdesc="Linux log viewer with interactive Terminal UI and powerful filtering engine"
arch=('any')
url="https://github.com/nirakar24/loglens"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-setuptools')
optdepends=('systemd: for journalctl log source support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9867acd5f85b93ebfa8b8958fcf1583ad315a76c9ef5f5a329dd2e01528775a1')

_pkg_srcdir() {
  local topdir
  topdir="$(bsdtar -tf "${srcdir}/${pkgname}-${pkgver}.tar.gz" | head -n1 | cut -d/ -f1)"
  printf '%s\n' "${srcdir}/${topdir}"
}

build() {
  cd "$(_pkg_srcdir)"
  python setup.py build
}

package() {
  cd "$(_pkg_srcdir)"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm755 logtui.py "$pkgdir/usr/bin/logtui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
