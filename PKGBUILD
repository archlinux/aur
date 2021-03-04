# Maintainer: Jochem Broekhoff <(lastname) dot (firstname) @ gmail.com>
# Contributor: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=nbtexplorer
pkgver=2.8.0
pkgrel=2
pkgdesc="Minecraft NBT Editor for editing player and world files."
arch=('any')
url="https://github.com/jaquadro/NBTExplorer"
license=('MIT')
depends=('mono')
makedepends=('msbuild')
options=('!strip')

source=(https://github.com/jaquadro/NBTExplorer/archive/v${pkgver}-win.zip
        nbtexplorer
        nbtexplorer.png
        nbtexplorer.desktop)

sha256sums=('a73b19d448db612f5bb1d947b5105ab3a5bce78abd1de975f6d91f5299ec6df4'
            '71ab50b6d72b30402f9c1796c43b7541308cec89ae07761e10d68ab81138492b'
            'f14cc58c71f0c8afef75f5b31ec441835aa7c8702530f469679215ae9c94e4c2'
            'd3390cc6b5a61d27cd24da8f0fa19d33e941bd626a633b364105ba23c2f13ae6')

build() {
    cd "${srcdir}/NBTExplorer-${pkgver}-win/NBTExplorer"
    msbuild NBTExplorer.csproj /p:Configuration=Release
}

package() {
    local builddir="${srcdir}/NBTExplorer-${pkgver}-win/NBTExplorer/bin/Release"
    
    # Binaries and libraries
    install -D -m644 "${builddir}/NBTExplorer.exe"        "${pkgdir}/usr/share/${pkgname}/NBTExplorer.exe"
    install -D -m644 "${builddir}/NBTExplorer.exe.config" "${pkgdir}/usr/share/${pkgname}/NBTExplorer.exe.config"
    install -D -m644 "${builddir}/Substrate.dll"          "${pkgdir}/usr/share/${pkgname}/Substrate.dll"
    install -D -m644 "${builddir}/NBTModel.dll"           "${pkgdir}/usr/share/${pkgname}/NBTModel.dll"

    # Launch script
    install -D -m755 "${srcdir}/nbtexplorer"              "${pkgdir}/usr/bin/${pkgname}"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/nbtexplorer.desktop"      "${pkgdir}/usr/share/applications/nbtexplorer.desktop"
    install -D -m644 "${srcdir}/nbtexplorer.png"          "${pkgdir}/usr/share/pixmaps/nbtexplorer.png"

    # License
    install -D -m644 "${srcdir}/NBTExplorer-${pkgver}-win/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
