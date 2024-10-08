# Maintainer: Khorne <khorne at khorne dot me>
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.35.2
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('mono')
makedepends=('msbuild' 'dotnet-host' 'dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KSP-CKAN/CKAN/archive/v${pkgver}.tar.gz")
sha256sums=('7ae9359a97f06f315c74948ee1e9ee9e6b05469c0879839f60b4d2fff075d9e1')

build(){
    cd "${pkgname^^}-$pkgver"
    ./build --configuration=Release
}

package() {
    cd "$srcdir"
    install -Dm755 "${pkgname^^}-$pkgver/debian/ckan" "${pkgdir}/usr/bin/ckan"
    install -Dm644 "${pkgname^^}-$pkgver/debian/ckan.desktop" "${pkgdir}/usr/share/applications/ckan.desktop"
    install -Dm644 "${pkgname^^}-$pkgver/assets/ckan.ico" "${pkgdir}/usr/share/icons/ckan.ico"
    install -Dm644 "${pkgname^^}-$pkgver/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname^^}-$pkgver/_build/ckan.exe" "${pkgdir}/usr/lib/${pkgname}/ckan.exe"
    install -Dm644 "${pkgname^^}-$pkgver/debian/ckan.1" "${pkgdir}/usr/share/man/man1/ckan.1"
}

