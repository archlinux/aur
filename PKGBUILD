# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-noiseprotocol-git
_pkgname=noiseprotocol
pkgver=0.3.1.r0.g7337544
pkgrel=2
pkgdesc="A Python implementation of Noise Protocol Framework"
arch=('any')
depends=('python' 'python-cryptography')
makedepends=('python-setuptools' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'git')
url="https://github.com/plizonczyk/noiseprotocol"
license=('MIT')
options=('!emptydirs')
optdepends=('python-pypandoc: Thin wrapper for pandoc - development'
            'twine: Collection of utilities for interacting with PyPI - development'
            'python-sphinx: Python documentation generator - development'
            'python-sphinx-autobuild: Rebuild Sphinx documentation on changes, with live-reload in the browser - development'
            'python-sphinx_rtd_theme: Read the Docs theme for Sphinx - development'
           )
source=(git+https://github.com/plizonczyk/noiseprotocol.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i "s%ImportError%ImportError,AttributeError%"  setup.py
  python setup.py build
}

check(){
  cd "$srcdir/$_pkgname"

  pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
