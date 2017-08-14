# Maintainer:  Soldatov Nikita "nvrmd" <n [at]nevermind.su>

pkgname=mindomo-bin
pkgver=8.0.24
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information."
arch=('x86_64')
url="https://www.mindomo.com"
license=('custom:mindomo')
provides=('mindomo')

source=('mindomo.desktop')
source_x86_64=('https://www.mindomo.com/download/8.0/Mindomo_v.'$pkgver'_x64.AppImage')

sha256sums=('c40dd838c3bd6ab7ef91f530d73dcb5f0c7313743769c7bb498cbe5d4131b4e1')
sha256sums_x86_64=('ed873e82534c0a4be204464386f61c89248c46e7649a1073d5c6fa24f2281227')

package() {
    # bin -> opt
    install -dm755 "${pkgdir}/opt"
    cp -r "${srcdir}/usr/bin" "${pkgdir}/opt/mindomo"
    chmod -R 755 "${pkgdir}/opt/mindomo"

    # symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/mindomo/Mindomo" "${pkgdir}/usr/bin/mindomo"

    # desktop
    install -Dm644 "$srcdir/mindomo.desktop" "$pkgdir/usr/share/applications/mindomo.desktop"

    # icons
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/usr/share/icons/default" "${pkgdir}/usr/share/icons/default"
    chmod -R 755 "${pkgdir}/usr/share/icons/default"
}