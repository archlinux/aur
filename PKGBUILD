pkgname=arch-os-app
pkgver=r19.f3b8bd6
pkgrel=1
pkgdesc="Arch OS App - System & Update Manager"
arch=('any')
url="https://github.com/murkl/arch-os-app"
license=('GPL2')
depends=('kitty' 'gum' 'libnotify' 'ttf-firacode-nerd' 'paru' 'flatpak')
makedepends=('git')
source=(arch-os.desktop $pkgname::git+$url.git)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/${pkgname}/"* "$pkgdir/opt/${pkgname}/"
    cp arch-os.desktop "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/opt/${pkgname}/arch-os"
    ln -s /opt/${pkgname}/arch-os "${pkgdir}/usr/bin/"
}

