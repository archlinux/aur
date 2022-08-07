# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>
# shellcheck disable=all

pkgname=python-buildozer
_pkgname=buildozer
pkgver=1.4.0
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python' 'python-colorama' 'python-pexpect' 'python-virtualenv' 'python-sh')
makedepends=('cmake' 'libusb' 'python-setuptools')
optdepends=('python-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=("${_pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('1f96680106a2750ba5b348df86bcbaba67c24b33b9cb7ca275066e7165ba36f7')
provides=('buildozer' 'python-buildozer')
conflicts=('buildozer')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
