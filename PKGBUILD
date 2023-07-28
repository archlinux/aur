# Maintainer: xihale <xihale.top@qq.com>
pkgname=affine-canary-releases
pkgver=0.7.0
pkgrel=59
pkgdesc="A privacy-focussed, local-first, open-source, and ready-to-use alternative for Notion & Miro."
arch=("x86_64")
license=('MPL-2.0')
source=("https://github.com/toeverything/AFFiNE/releases/download/v${pkgver}-canary.${pkgrel}/affine-canary-linux-x64.zip")
sha256sums=("SKIP")
makedepends=('gendesk')

package() {
    first_dir=$(find . -maxdepth 1 -type d | head -n 3 | tail -n 1)
    install -Dm755 $first_dir/AFFiNE-canary -t $pkgdir/opt/affine-canary/
    install -Dm644 "$first_dir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "$first_dir/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/affine.png"
    gendesk -f -n --icon "affine" --categories "Utility" --name "AFFiNE" --exec "/opt/affine-canary/AFFiNE-canary"
    install -Dm644 "${srcdir}/$pkgname.desktop" -t "${pkgdir}/usr/share/applications"
    mv $first_dir/* $pkgdir/opt/affine-canary/
}
