# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergi Jimenez <sjr@redhat.com>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=python2-kubernetes
_pkgbase=kubernetes
pkgver=11.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
arch=('any')
url='https://github.com/kubernetes-client/python'
depends=('python2'
         'python2-certifi'
         'python2-six'
         'python2-dateutil'
         'python2-urllib3'
         'python2-yaml'
         'python2-google-auth'
         'python2-websocket-client'
         'python2-requests'
         'python2-requests-oauthlib'
         'python2-adal')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-pluggy' 'python2-py' 'python2-mock' 'python2-recommonmark' 'python2-isort')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase::1}/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('1a2472f8b01bc6aa87e3a34781f859bded5a5c8ff791a53d889a8bd6cc550430')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  :
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  py.test -vvv -s --ignore=kubernetes/e2e_test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
