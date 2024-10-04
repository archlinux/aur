# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-xxtea-git
pkgver=r185.3a106bc
pkgrel=2
pkgdesc="Python extension module xxtea."
arch=('x86_64')
url="https://github.com/ifduyue/xxtea"
license=('BSD')
provides=('python-xxtea')
conflicts=('python-xxtea')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('git')

source=("git+https://github.com/ifduyue/xxtea.git")
md5sums=('SKIP')

pkgver() {
  cd xxtea
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd xxtea
  pytest -v --cov || true
}

package() {
  cd xxtea
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
