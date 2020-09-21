# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Dan Beste <Dan.Ray.Beste@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_pkgname='python-black'
pkgname="${_pkgname}-git"
pkgver=20.8b1.r24.g6dddbd7
pkgrel=1
pkgdesc='Uncompromising Python code formatter'
arch=('any')
url='https://github.com/psf/black'
license=('MIT')
depends=('python'
        'python-appdirs'
        'python-click'
        'python-mypy_extensions'
        'python-pathspec'
        'python-regex'
        'python-setuptools'
        'python-toml'
        'python-typed-ast'
        'python-typing_extensions')
makedepends=('git' 'python-setuptools')
optdepends=('python-aiohttp: for the blackd HTTP server'
            'python-aiohttp-cors: for the blackd HTTP server'
            'python-colorama: for colored diffs')
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
