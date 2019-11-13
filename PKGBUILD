# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

_pkgbase="visdom"
pkgname=python-visdom-git
pkgver=r288.bb0ab59
pkgrel=1
arch=(any)
url='https://github.com/facebookresearch/visdom'
pkgdesc='Visualization tool for Pytorch by Facebook'
license=(CCPL:by-nc)
depends=('python-websocket-client' 'python-numpy' 'python-scipy' 'python-requests' 'python-tornado' 'python-pyzmq' 'python-six' 'python-jsonpatch' 'python-pillow')
makedepends=(
  'git'
  'python-setuptools'
)
options=(!emptydirs)
source=("git+https://github.com/facebookresearch/visdom.git" "visdom.conf" "visdom.group.conf")
sha256sums=('SKIP'
            'f795c8a3185282b366e7942b07b5ac74b9c293d1eb0f15727cf26905c1d7934e'
            'd71fbfa6bb3feecfb1997a459da196f8a2f0f50b33428043921803d97db5562c')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-visdom-git() {
provides=('python-visdom')
conflicts=('python-visdom')
install='visdom.install'
  cd "${srcdir}/${_pkgbase}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/${_pkgbase}.group.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.group.conf"
  install -Dm 644 "${srcdir}/${_pkgbase}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
