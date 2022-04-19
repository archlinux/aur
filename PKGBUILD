# Maintainer: Vincent Post <cent@spline.de>
pkgname=xivlauncher
pkgver=6.2.31
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online (Crossplatform rewrite)"
arch=('x86_64')
url='https://github.com/goatcorp/FFXIVQuickLauncher/'
license=('GPL')
depends=('aria2')
makedepends=('dotnet-sdk')
optdepends=('steam')
source=("FFXIVQuickLauncher::git+https://github.com/goatcorp/FFXIVQuickLauncher.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/FFXIVQuickLauncher/src/XIVLauncher.Core/"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build"
}

package() {
    mkdir -p "${pkgdir}/opt/XIVLauncher" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
}
