# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: lucc <l-m-h@web.de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: astiam <astiamm at gmail dot com>

pkgbase=python-neovim
pkgname=(python2-neovim python-neovim)
pkgver=0.0.38
pkgrel=2
arch=('any')
license=('Apache')
url='https://github.com/neovim/python-client'
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://github.com/neovim/python-client/archive/${pkgver}.tar.gz")
sha256sums=('c5711ff16d020e71cf19f4916e82ba3fed4ee4871b4eedaa561d5bc2d29670ae')

build_python2-neovim() {
  cd "${srcdir}/python-client-${pkgver}"
  python2 setup.py build
}

package_python2-neovim() {
  pkgdesc='Adds support for Python 2 plugins to Neovim.'
  depends=('neovim' 'python2' 'python2-msgpack' 'python2-greenlet'
           'python2-trollius')
  optdepends=('python2-cairo: for experimental GUI (pynvim)'
              'python2-click: for experimental GUI (pynvim)'
              'python2-gobject: for experimental GUI (pynvim)')

  cd "${srcdir}/python-client-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

build_python-neovim() {
  cd "${srcdir}/python-client-${pkgver}"
  python setup.py build
}

package_python-neovim() {
  pkgdesc='Adds support for Python 3 plugins to Neovim.'
  depends=('neovim' 'python' 'python-msgpack' 'python-greenlet')
  provides=("python3-neovim=${pkgver}")
  conflicts=('python3-neovim')

  cd "${srcdir}/python-client-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

# vim:set sw=2 sts=2 et:
