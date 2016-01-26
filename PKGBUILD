# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='nsenter'
pkgname="python-${_pkgname}"
pkgver=0.2
pkgrel=4
pkgdesc='Small context manager for entering Linux kernel namespaces.'
arch=('any')
url='https://pypi.python.org/pypi/nsenter'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=(
  "https://pypi.python.org/packages/source/n/nsenter/nsenter-${pkgver}.tar.gz"
  "entrypoint-name.patch"
  "optional-reqs.patch"
)
sha256sums=(
  '876a18cb03de85948e4cd72fd4cfda4879561b7264f5722603f6437d452a25cb'
  '7c2b8e23da50f937a1e3515f085eb5dc0fbb4ece188b0a2e140b4bc5a2ff62bc'
  'e4043c6c971691c6c9d240abe86a9e10306ce4b6cdf9f5cbd053deb000b1e343'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 <"$srcdir/entrypoint-name.patch"
  patch -Np1 <"$srcdir/optional-reqs.patch"
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
