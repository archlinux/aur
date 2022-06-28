# Maintainer: Tony Lambiris <tony@libpcap.net>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-pynvim
_pkgname=${pkgname#*-}
pkgver=0.4.3
pkgrel=2
pkgdesc='Python client for Neovim.'
arch=('any')
url='https://github.com/neovim/pynvim'
license=('Apache')
depends=('python2' 'python2-msgpack' 'python2-greenlet')
provides=('python2-neovim')
replaces=('python2-neovim')
makedepends=('python2-setuptools')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/neovim/python-client/archive/${pkgver}.tar.gz")
sha256sums=('e7c9de44b0201ad874a608270b7a9b10fd48bda65f49bada05815d973ca79391')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    find . -type f -name '*.py' -exec sed -i "s/from msgpack/from msgpack.fallback/g" "{}" \;
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}
