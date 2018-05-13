# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Andrew Smith <ChucklesTheBeard@gmail.com>
# Contributor: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=ckan-git
pkgver=1.25.1.r9.g5c5cb609
pkgrel=1
pkgdesc="A metadata repository and associated tools for searching, installing, and managing mods for Kerbal Space Program (KSP)"
arch=('any')
url="https://github.com/KSP-CKAN/CKAN"
license=('MIT')
provides=('ckan')
conflicts=('ckan')
depends=('mono')
makedepends=('git' 'python2' 'python2-requests')
source=('git+https://github.com/KSP-CKAN/CKAN'
        'ckan')
sha256sums=('SKIP'
            '80d9c6d68d6bd226954d4fa8081d0adb0c58acd1047cea5bbbaf601ad30a129e')

pkgver() {
  cd ${srcdir}/CKAN
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/CKAN
  ./build
}

package() {
  install -Dm755 ckan ${pkgdir}/usr/bin/ckan
  install -Dm755 CKAN/_build/ckan.exe ${pkgdir}/usr/lib/ckan/ckan.exe
}
