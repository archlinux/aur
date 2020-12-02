# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname='trimage'
pkgname="${_pkgname}-git"
pkgver=1.0.6.r12.gc21089f
pkgrel=2
pkgdesc='Tool for optimizing PNG and JPG files'
arch=('any')
url='https://trimage.org'
_url_source='https://github.com/Kilian/Trimage'
license=('MIT')
depends=('advancecomp' 'hicolor-icon-theme' 'jpegoptim' 'optipng' 'pngcrush' 'python-pyqt5')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${_url_source}.git")
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
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'COPYING' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
