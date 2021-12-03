# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-fints
pkgver=3.0.1
pkgrel=2
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz"
        $pkgname-python310.patch::https://github.com/raphaelm/python-fints/commit/901805f1c0a0.patch)
sha512sums=('78dd0e895bc075fd80f43ae16b16eedc7d2978ae8e0c9b4b3eb47b11550a2dc61962b1864ea63ce3ccd842acd0fa6dc2db98ea1b1fd7c1d23c4227ea352c01ce'
            '9ef2f63d55ab01d315a2d7a6b22422caf4552b228902ed84a47242575ca36310a78e9e0dc811e475ce928bf73872f54fd5703d71999a544ddd8df0621811e068')
b2sums=('13a62e1ec7a43a8cd0196e01eb1c60471b09f89ef2cb55cce7908de1b76f38a063c63bb4121a48206869424c2fedf23fd176248862c96f183e7b960ac5f8137a'
        '3f2a548abd4602d7c9336ca2e231ec1df95fd8e7486cb5cd6817ba1fea267415be17971bad8219fa5f0ebb539dae0ed4999c22b1eb8cbaa6654b6e57a9175caa')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../$pkgname-python310.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim:set ts=2 sw=2 et:
