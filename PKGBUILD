# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Based on python-aiorpcx https://www.archlinux.org/packages/community/any/python-aiorpcx/ by Santiago Torres-Arias <santiago@archlinux.org>

pkgname='python-aiorpcx-git'
_gitname='aiorpcX'
pkgver=0.20.1.r0.ga5e1da5
pkgrel=1
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both."
url="https://github.com/kyuupichan/aiorpcX/"
arch=('any')
license=('MIT')
provides=('python-aiorpcx')
conflicts=('python-aiorpcx')
depends=('python>=3.6' 'python-attrs')
makedepends=('python-setuptools' 'git')
optdepends=('python-websockets')
source=("git://github.com/kyuupichan/aiorpcX.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
    
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
