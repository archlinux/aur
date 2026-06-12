# Maintainer: AstralDesigns <ianomiruka@gmail.com>
pkgname=hyprcandy-plus
pkgver=1.1.17
pkgrel=1
pkgdesc="HyprCandy+ installer — a cohesive Hyprland desktop experience"
arch=('any')
url="https://github.com/AstralDesigns/candyinstall"
license=('custom')
depends=('bash' 'git' 'curl' 'kitty' 'hyprland' 'quickshell-git')
optdepends=(
    'hyprland-git: latest development build of Hyprland (replaces hyprland)'
)
# Source is the install.sh attached to the GitHub release.
# Update pkgver + the sha256sum when you cut a new release.
source=("install.sh::https://github.com/AstralDesigns/candyinstall/releases/download/v${pkgver}/install.sh"
        "Candy_Update.sh::https://github.com/AstralDesigns/candyinstall/releases/download/v${pkgver}/Candy_Update.sh")
sha256sums=('SKIP'
            'SKIP')
install=hyprcandy-plus.install

# No build step needed — pure shell scripts
build() {
    :
}

package() {
    # Install the main installer as hc-install
    install -Dm755 "${srcdir}/install.sh" \
        "${pkgdir}/usr/local/bin/hc-install"

    # Install the updater as hc-update - run from the bar's update popup
    install -Dm755 "${srcdir}/Candy_Update.sh" \
        "${pkgdir}/usr/local/bin/hc-update"

    # License placeholder — replace with your actual licence file if you have one
    install -Dm644 /dev/null \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
