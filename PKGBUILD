# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname='python-redmine'
pkgver='2.5.0'
pkgrel='1'
pkgdesc="Python library for communicating with a Redmine project management application"
arch=("any")
url="https://${pkgname}.com"
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-requests' 'python-coverage')
license=('Apache')
source=("https://github.com/maxtepkeev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a51f45fc6d4b5e6d7331d72dcda4e179c42414fffb73e7c4a176d94392006f6a')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgbase}-${pkgver}"
  nosetests --with-coverage --cover-erase --cover-package=redminelib
}

package() {
  cd "${pkgbase}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
