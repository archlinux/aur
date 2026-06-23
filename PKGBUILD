# Maintainer: Danila Vershinin <ciapnz@gmail.com>
pkgname=gixy-ng
_pyname=gixy_ng
pkgver=0.2.49
pkgrel=1
pkgdesc="NGINX configuration static analyzer focused on security (maintained fork of yandex/gixy)"
arch=('any')
url="https://gixy.getpagespeed.com/"
license=('MPL2')
depends=('python' 'python-ngxparse' 'python-jinja' 'python-configargparse')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-rich: prettier terminal output'
            'python-requests: ReDoS checks via external API')
provides=('gixy')
conflicts=('gixy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('ee79f29ec5d7c80b4af66755d6d4966f26e9341923089a99d98f2f5c0973edf5')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
