pkgname=arch-os-manager
pkgver=r37.dad8e0e
pkgrel=1
pkgdesc="Arch OS System Manager"
arch=('any')
url="https://github.com/murkl/arch-os-manager"
license=('GPL2')
depends=('paru' 'pacman-contrib' 'kitty' 'gum' 'libnotify' 'ttf-firacode-nerd')
optdepends=('downgrade: Add support for downgrading packages' 'flatpak: Add support for flatpak')
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

