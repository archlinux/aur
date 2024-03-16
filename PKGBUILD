# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Andrew Smith <ChucklesTheBeard@gmail.com>
# Contributor: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=ckan-git
pkgver=1.34.4.r128.g4694463c
pkgrel=1
pkgdesc="A metadata repository and associated tools for searching, installing, and managing mods for Kerbal Space Program (KSP)"
arch=('any')
url="https://github.com/KSP-CKAN/CKAN"
license=('MIT')
provides=('ckan')
conflicts=('ckan')
depends=('mono')
makedepends=('git' 'mono-msbuild' 'dotnet-sdk')
source=('git+https://github.com/KSP-CKAN/CKAN'
        'ckan')
sha256sums=('SKIP'
            '80d9c6d68d6bd226954d4fa8081d0adb0c58acd1047cea5bbbaf601ad30a129e')

pkgver() {
  cd "CKAN"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "CKAN"
  ./build
}

package() {
  install -Dm755 ckan "$pkgdir/usr/bin/ckan"
  install -Dm755 CKAN/_build/ckan.exe "$pkgdir/usr/lib/ckan/ckan.exe"
  install -Dm644 CKAN/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
