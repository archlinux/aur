# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=superpaper
pkgname=${_pkgname}-git
pkgver=2.3.2+18+g16076f4
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
#url="https://github.com/hhannine/Superpaper"
url='https://github.com/mauro-lanza/superpaper-next'
license=('MIT')
depends=('python-pillow>=12.2.0' 'python-screeninfo>=0.8.1' 'python-wxpython'
         'python-system_hotkey>=1.0.5' 'python-xpybutil' 'python-numpy'
         'python-xcffib' 'dbus-python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
provides=("${_pkgname}=${pkgver%%+}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}"
        'rename_system_hotkey_dep.patch')
sha256sums=('SKIP'
            '57fadb4d0da677158916f15859f237c1bba6e52209502495850be9c0f108ffa2')

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
