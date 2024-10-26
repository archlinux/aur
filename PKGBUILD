# packager: teraflops <cprieto.ortiz@gmail.com>
pkgname=bepasty-cli
pkgver=r55.d48e9d1
pkgrel=1
pkgdesc="CLI client for bepasty-server."
arch=('any')
url="https://github.com/bepasty/bepasty-client-cli"
license=('BSD')
depends=('python' 'python-requests' 'python-magic')
makedepends=('git' 'python-setuptools')
provides=('bepasty-cli')
conflicts=('bepasty-cli')
source=("${pkgname}::git+https://github.com/bepasty/bepasty-client-cli.git")
md5sums=('SKIP')
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's/ftype = mime.from_buffer(first_chunk).decode()/ftype = mime.from_buffer(first_chunk)/' bepasty_cli/cli.py
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

