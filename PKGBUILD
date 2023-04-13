# Maintainer: Khorne <khorne at khorne dot me>
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.32.0
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('mono')
makedepends=('msbuild')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KSP-CKAN/CKAN/archive/v${pkgver}.tar.gz")
sha256sums=('7aa08a7ae73b24c9b2cdd713dcec2db1156e02a8e55e43c039679781e60dcfa9')

build(){
    cd "${pkgname^^}-$pkgver"
    ./build --configuration=Release
}

package() {
    cd "$srcdir"
    install -Dm755 "${pkgname^^}-$pkgver/debian/ckan" "${pkgdir}/usr/bin/ckan"
    install -Dm644 "${pkgname^^}-$pkgver/debian/ckan.desktop" "${pkgdir}/usr/share/applications/ckan.desktop"
    install -Dm644 "${pkgname^^}-$pkgver/debian/ckan.ico" "${pkgdir}/usr/share/icons/ckan.ico"
    install -Dm644 "${pkgname^^}-$pkgver/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname^^}-$pkgver/_build/ckan.exe" "${pkgdir}/usr/lib/${pkgname}/ckan.exe"
    install -Dm644 "${pkgname^^}-$pkgver/debian/ckan.1" "${pkgdir}/usr/share/man/man1/ckan.1"
}

