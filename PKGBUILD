# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=colin
pkgver=0.4.0
pkgrel=2
pkgdesc='Tool to check generic rules/best-practices for containers/images/dockerfiles.'
arch=(any)
url='https://github.com/user-cont/colin'
license=(GPL3)
depends=('python'
         'python-click'
         'python-six'
         'python-dockerfile_parse'
         'python-fmf'
         'python-pyaml')
optdepends=('podman: for checking image target-type'
            'ostree: to use ostree target'
            'atomic: to use ostree target'
            'skopeo: to use ostree target')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/user-cont/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('34d830b68eeeb6384c12074202343ae0a1bb12e2a7fd7c869b04075e1e8df941896ac30c66f7fa1ed8482c8bd4c68f64ae920b105181e3f0f7303b5fb645020b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
