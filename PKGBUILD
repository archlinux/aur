# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgbase=sensual-git
pkgname=('sensual-kde-theme-git' 'sensual-kvantum-theme-git' 'sensual-breeze-git' 'sensual-breeze-icons-git' 'sensual-sddm-theme-git')
pkgver=r555.52b16a2
pkgrel=1
pkgdesc="Sensual theme for Plasma desktop"
arch=('any')
url="https://github.com/L4ki/Sensual-Theme.git"
license=('GPL3')
makedepends=('git')
source=("$pkgbase::git+https://github.com/L4ki/Sensual-Theme.git")
md5sums=('SKIP')
options+=('!strip')

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sensual-kde-theme-git() {
    optdepends=(
        'sensual-kvantum-theme-git: Sensual theme for Kvantum Qt style (recommended)'
        'sensual-breeze-git: Matching GTK theme'
        'sensual-breeze-icons-git: Default icons'
        'breeze-chameleon-icons: Alternative icons'
        'sensual-sddm-theme-git: Matching SDDM theme'
    )

    # look and feel
    install -d "$pkgdir/usr/share/plasma/look-and-feel/"
    cd "$srcdir/$pkgbase/Sensual-Global"
    find "Sensual-Dark-Global" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual-Dark\)-Global/\1/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/plasma/look-and-feel/$f1"
    done

    # main theme
    install -d "$pkgdir/usr/share/plasma/desktoptheme/"
    cd "$srcdir/$pkgbase/Sensual-Plasma"
    find "Sensual-Dark" -type f | while read -r f; do
        install -Dm644 "$f" "$pkgdir/usr/share/plasma/desktoptheme/$f"
    done

    # colours
    install -d "$pkgdir/usr/share/color-schemes/"
    install -Dm644 "$srcdir/$pkgbase/Sensual-Color/SensualDark.colors" "$pkgdir/usr/share/color-schemes/Sensual-Dark.colors"
    install -Dm644 "$srcdir/$pkgbase/Sensual-Color/SensualLight.colors" "$pkgdir/usr/share/color-schemes/Sensual-Light.colors"

    install -d "$pkgdir/usr/share/aurorae/themes/"
    # Aurorae
    cd "$srcdir/$pkgbase/Sensual-Aurorae/Sensual-Aurorae"
    find "Sensual-Aurorae" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual\)-Aurorae/\1/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/aurorae/themes/$f1"
    done
    # Aurorae v.2
    cd "$srcdir/$pkgbase/Sensual-Aurorae/Sensual-Aurorae-v.2"
    find "Sensual-Aurorae-v.2" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual\)-Aurorae-v\.2/\1-v.2/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/aurorae/themes/$f1"
    done

    # wallpapers
    install -d "$pkgdir/usr/share/wallpapers/"
    cd "$srcdir/$pkgbase"
    find "Sensual-Wallpapers" -type f | while read -r f; do
        install -Dm644 -t "$pkgdir/usr/share/wallpapers/" "$f"
    done
}

package_sensual-kvantum-theme-git() {
    pkgdesc="Sensual Breeze theme for Kvantum"

    install -d "$pkgdir/usr/share/Kvantum/"
    cd "$srcdir/$pkgbase/Sensual-Kvantum"
    find "SensualKvantum" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual\)Kvantum/\1/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/Kvantum/$f1"
    done
}

package_sensual-breeze-git() {
    pkgdesc="Sensual Breeze theme for GTK 2/3"

    install -d "$pkgdir/usr/share/themes/"
    cd "$srcdir/$pkgbase"
    find "Sensual-Breeze-GTK-3" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual-Breeze\)-GTK-3/\1/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/themes/$f1"
    done
}

package_sensual-breeze-icons-git() {
    pkgdesc="Sensual Breeze icons"
    depends=('gtk-update-icon-cache')

    install -d "$pkgdir/usr/share/icons/"
    cd "$srcdir/$pkgbase/Sensual-Icons"
    find "Sensual-Breeze-Dark" "Sensual-Breeze-Light" -type f | while read -r f; do
        install -Dm644 "$f" "$pkgdir/usr/share/icons/$f"
    done
}

package_sensual-sddm-theme-git() {
    pkgdesc="Sensual theme for SDDM"
    depends=('sddm')

    install -d "$pkgdir/usr/share/sddm/themes/"
    cd "$srcdir/$pkgbase/Sensual-SDDM"
    find "Sensual-SDDM" -type f | while read -r f; do
        f1="$(sed 's/^\(Sensual\)-SDDM/\1/' <<< "$f")"
        install -Dm644 "$f" "$pkgdir/usr/share/sddm/themes/$f1"
    done
}
