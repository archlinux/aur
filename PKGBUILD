# Maintainer: Ivan Shapovalov <intelfx@intelfx.name
# Contributor: Javier Tiá <javier.tia at gmail dot com>
# Contributors: Javier Vazquez <j.e.vasquez.v at gmail dot com>
# Contributors: Nagy Gábor <ngm.hun at gmail dot com>

_pkgname=GDriveFS
pkgname=gdrivefs-git
pkgver=0.14.13.r5.gd307b04
pkgrel=1
pkgdesc='A complete FUSE adapter for Google Drive'
url='https://github.com/dsoprea/GDriveFS'
depends=(
  'python'
  'python-google-api-python-client'
  'python-six'
  'python-fusepy'
  'python-greenlet'
  'python-httplib2'
  'python-dateutil'
  'python-oauth2client'
)
makedepends=(
  'python-setuptools'
)
license=('GPL2')
arch=('any')
source=("git+https://github.com/dsoprea/GDriveFS"
        '0001-Allow-python-oauth2client-4.x.x.patch')
sha256sums=('SKIP'
            'd10039e8ce65da644099128740b6f821de71f77facb206029994bf4bbeef659a')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/-/.r/;s/-/./'
}

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "${_pkgname}"
  for p in "${source[@]}"; do
    if [[ ${p} == *.patch ]]; then
      git apply "${srcdir}/${p}"
    fi
  done
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
