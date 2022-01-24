# Maintainer:  Narinas <eatrujillo@protonmail.com>

pkgname=mindomo-bin
pkgver=10.1.7
basever=10.1
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information."
arch=('x86_64')
url="https://www.mindomo.com"
license=('custom:mindomo')
provides=('mindomo')
conflicts=('mindomo')

app_image="Mindomo_v.${pkgver}_x64.AppImage"

source=("$pkgname.desktop")
sha256sums=('c40dd838c3bd6ab7ef91f530d73dcb5f0c7313743769c7bb498cbe5d4131b4e1')

source_x86_64=("https://www.mindomo.com/download/${basever}/${app_image}")

sha256sums_x86_64=('d0a3f12ce9e28f449751a4e964a3b84e2e008bebcc8037e1ab3309f1aa44a357')

package() {
    # bin -> opt
    install -d "${pkgdir}"{/opt/$pkgname,/usr/bin}
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    cp -r "${srcdir}/${app_image}" "${pkgdir}/opt/${pkgname}/${app_image}"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"

    # symlink
    ln -s "${pkgdir}/opt/${pkgname}/${app_image}" "${pkgdir}/usr/bin/mindomo"
    chmod +x "${pkgdir}/usr/bin/mindomo"

}
