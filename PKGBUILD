# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.1.0+32+g7d0b284
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow>=7.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
_commit='7d0b28400cccafa57f7a43ca2342d73c3293ff92'
source=("${pkgname}::git+https://github.com/hhannine/${pkgname^}#commit=${_commit}")
sha256sums=('SKIP')
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz")
#sha256sums=('1de27ea76b77731c6a6e0221450cd3913a2275399c553ae7c13557ca7c2f5c08')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build -wn
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
