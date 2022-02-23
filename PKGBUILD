# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=superpaper
pkgname=${_pkgname}-git
pkgver=2.1.0+32+g7d0b284
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow>=7.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
provides=("${_pkgname}=${pkgver%%+}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/hhannine/${_pkgname^}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build -wn
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
