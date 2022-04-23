# Maintainer: Vincent Post <cent@spline.de>
pkgname=xivlauncher
pkgver=6.2.31
pkgrel=6
pkgdesc="Custom Launcher for Final Fantasy XIV Online (Crossplatform rewrite)"
arch=('x86_64')
url='https://github.com/goatcorp/FFXIVQuickLauncher/'
license=('GPL')
depends=(
    'aria2'
    'sdl2' 'lib32-sdl2'
    'libsecret'
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'    'jxrlib'
)
makedepends=('dotnet-sdk>=6')
optdepends=('steam')
options=('!strip')
source=(
    "https://github.com/goatcorp/FFXIVQuickLauncher/archive/refs/tags/6.2.31.tar.gz"
    "https://raw.githubusercontent.com/goatcorp/FFXIVQuickLauncher/master/src/XIVLauncher.Core/Resources/logo.png"
    "XIVLauncher.desktop"
)
sha512sums=(
    '0f2de5ff1d52e5ed5c799180506d570a01f1d4967106c83e6cebf60493db37e432cb6fcbdfb4f3a067301b0f82ba1919ea23e0412347e4353141dc3795f7f280'
    '4f16ba269ecd60c16a125db5e986d0bdabd69ac51d03ccb01a7203ddd04dea9d40147ee412bbfc37921ca83ff70a966258ae729bcada95ce1582b43160686694'
    '5ac774f858d4015c59e6758e2a706b93e822bca9c046ed87210deabc141ac101020d2654fbcf8314f9409a4cfcf921d1e26ec0a3b0beab02d1bcd045fb6e6f14'
)

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/FFXIVQuickLauncher-${pkgver}/src/XIVLauncher.Core/"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/logo.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
}
