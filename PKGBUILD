# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='nsenter'
pkgname="python-${_pkgname}"
pkgver=0.2
pkgrel=2
pkgdesc='Small context manager for entering Linux kernel namespaces.'
arch=('any')
url='https://pypi.python.org/pypi/nsenter'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=(
  "https://pypi.python.org/packages/source/n/nsenter/nsenter-${pkgver}.tar.gz"
  "entrypoint-name.patch"
)
sha256sums=(
  '876a18cb03de85948e4cd72fd4cfda4879561b7264f5722603f6437d452a25cb'
  '7c2b8e23da50f937a1e3515f085eb5dc0fbb4ece188b0a2e140b4bc5a2ff62bc'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 <"$srcdir/entrypoint-name.patch"
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
