# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-visdom-git
_pkgbase="visdom"
pkgname=(python-visdom-git python2-visdom-git)
pkgver=r274.35a3576
pkgrel=1
arch=(any)
url='https://github.com/facebookresearch/visdom'
pkgdesc='Visualization tool for Pytorch by Facebook'
license=(CCPL:by-nc)
makedepends=(
  'git'
  'python-setuptools'
  'python2-setuptools'
)
options=(!emptydirs)
source=("git+https://github.com/facebookresearch/visdom.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-visdom-git() {
depends=('python-websocket-client' 'python-numpy' 'python-scipy' 'python-requests' 'python-tornado' 'python-pyzmq' 'python-six' 'python-torchfile')
provides=('python-visdom')
conflicts=('python-visdom')
install='visdom.install'
  cd "${srcdir}/${_pkgbase}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chmod -R 775 "${pkgdir}/usr/lib/python3.7/site-packages/${_pkgbase}"
}

package_python2-visdom-git() {
depends=('python2-websocket-client' 'python2-numpy' 'python2-scipy' 'python2-requests' 'python2-tornado' 'python2-pyzmq' 'python2-six' 'python2-torchfile')
provides=('python2-visdom')
conflicts=('python2-visdom')
install='visdom2.install'
  cd "${srcdir}/${_pkgbase}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/visdom" "${pkgdir}/usr/bin/visdom2"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chmod -R 775 "${pkgdir}/usr/lib/python2.7/site-packages/${_pkgbase}"
}
