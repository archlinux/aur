# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
_pkgname=superpaper-next
pkgver=2.3.2
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
#url="https://github.com/hhannine/Superpaper"
url='https://github.com/mauro-lanza/superpaper-next'
license=('MIT')
depends=('python-pillow>=7.0.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.5' 'python-xpybutil' 'python-numpy'
         'python-xcffib' 'dbus-python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'rename_system_hotkey_dep.patch')
sha256sums=('9d47b9b0c4c445c0839ae87d80556a22f6b2b793a1122c34e296a7e393e2ae86'
            '82388e2c46a43a53d84372cb5b45be10ad7f18de48e658ac2226c7ec2d42cd15')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np2 -r- -i ../rename_system_hotkey_dep.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
