# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=sweet-kde-git
pkgname=(sweet-kde-git kvantum-theme-sweet-git)
_pkgname=sweet
pkgver=r109.0d214a6
pkgrel=1
pkgdesc="A very sweet theme"
arch=(any)
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sweet-kde-git() {
    provides=('sweet-kde')
    optdepends=('sweet-theme-git: Matching GTK theme'
                'kvantum-theme-sweet: Sweet theme for Kvantum Qt style (recommended)'
                'candy-icons: Matching icon theme')

    cd $_pkgname/kde

    install -d "$pkgdir"/usr/share
    
    # Temporary: https://github.com/EliverLara/Sweet/issues/78
    mkdir -p aurorae/themes
    mv aurorae/Sweet-Dark aurorae/themes/Sweet-Dark
    mv aurorae/Sweet-Dark-transparent aurorae/themes/Sweet-Dark-transparent
    rm aurorae/.shade.svg
    mv colorschemes color-schemes
    mkdir -p Kvantum
    mv kvantum Kvantum/Sweet
    mkdir -p plasma/look-and-feel
    mv look-and-feel plasma/look-and-feel/com.github.eliverlara.sweet
    mv sddm sddm-Sweet
    mkdir -p sddm/themes
    mv sddm-Sweet sddm/themes/Sweet

    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
    cp -r konsole "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
    cp -r sddm "$pkgdir"/usr/share
}

package_kvantum-theme-sweet-git() {
    provides=('kvantum-theme-sweet')
    pkgdesc="Sweet theme for KDE Plasma 5"
    depends=(kvantum-qt5)

    cd $_pkgname/kde

    install -d "$pkgdir"/usr/share

    cp -r Kvantum "$pkgdir"/usr/share
}
