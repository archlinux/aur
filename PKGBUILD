# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=colin
pkgver=0.5.0
pkgrel=1
pkgdesc='Tool to check generic rules/best-practices for containers/images/dockerfiles.'
arch=(any)
url='https://github.com/user-cont/colin'
license=(GPL3)
depends=('python'
         'python-click'
         'python-six'
         'python-dockerfile-parse'
         'python-fmf'
         'python-pyaml')
optdepends=('podman: for checking image target-type'
            'ostree: to use ostree target'
            'atomic: to use ostree target'
            'skopeo: to use ostree target')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/user-cont/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('01685bd681bb5482e8a6f284613a0aa303df64eba1b53824dbbc89fe9cd92b8cdd9585ccdac5bb67d023007c572c210c821cd9d5d0a81577c91de3671a15e8a6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
