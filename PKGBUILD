# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=superpaper
pkgname=${_pkgname}-git
pkgver=2.2.0+2+g299f7e5
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow>=7.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=5' 'python-xpybutil' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
provides=("${_pkgname}=${pkgver%%+}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/hhannine/${_pkgname^}"
        'rename_system_hotkey_dep.patch')
sha256sums=('SKIP'
            '02bc7fb70c18c7292ee9cdac9be58e0954cdb03b07032ee9b5c567fe5ec4d5a5')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  patch -Np2 -r- -i ../rename_system_hotkey_dep.patch
}

build() {
  cd "${_pkgname}"
  python -m build -wn
}

package() {
  cd "${_pkgname}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
