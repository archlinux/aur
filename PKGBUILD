# Maintainer: Alexandre Jesus <adbjesus@gmail.com>

_pkgname=soccer-cli
pkgname=${_pkgname}-git
pkgver=20170813_r262.429f2d3
pkgrel=1
pkgdesc="Soccer for Hackers - a CLI for all the football scores."
arch=('any')
url="https://github.com/architv/soccer-cli"
license=('MIT')
depends=('python2' 'python2-click' 'python2-requests')
makedepends=('git')
provides=("${_pkgname}")
source=('git+https://github.com/architv/soccer-cli.git')
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "%s_r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"

  sed -i -e 's/requests==2/requests>=2/' setup.py
}

package() {
  cd "$srcdir/${_pkgname}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

