# Maintainer: Miss Mary-ELITE <asd8761425@gmail.com>
pkgname=elite-dms-niri-git
pkgver=r4.0dabc1d
pkgrel=1
pkgdesc="Elite DMS Niri desktop environment (Core Configs & Installer)"
arch=('any')
url="https://github.com/MEKCCK/elite-dms-niri"
license=('GPL')
provides=('elite-dms-niri-meta' 'elite-dms-niri-dotfiles-git')
conflicts=('elite-dms-niri-meta' 'elite-dms-niri-dotfiles-git')

depends=(
    'bash' 'dms-shell-niri' 'xdg-desktop-portal-gnome' 'xwayland-satellite'
    'libnotify' 'power-profiles-daemon' 'wl-clipboard' 'cliphist' 'cava'
    'dgop' 'dsearch-bin' 'qt5-multimedia' 'cups-pk-helper' 'kimageformats'
)

makedepends=('git')

source=("git+https://github.com/MEKCCK/elite-dms-niri.git#branch=elite")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/elite-dms-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/elite-dms-niri"

    local target_dir="$pkgdir/usr/share/elite-dms-niri"
    install -dm755 "$target_dir"

    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    if [[ -f "elitedms" ]]; then
        install -Dm755 elitedms "$pkgdir/usr/bin/elitedms"
    else
        echo "Error: 'elitedms' script not found."
        exit 1
    fi

    if [[ -f "README-DMS.txt" ]]; then
        install -Dm644 "README-DMS.txt" "$pkgdir/usr/share/doc/elite-dms-niri/README-DMS.txt"
    fi
}
