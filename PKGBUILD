# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='inspektor'
pkgname="${_pkgname}-git"
pkgver=1.0.32.r2.g755702b
pkgrel=1
pkgdesc='View metadata information on files'
arch=('any')
url='https://github.com/hezral/inspektor'
license=('GPL3')
depends=('attr' 'gtk3' 'perl-image-exiftool' 'python')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
