# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgbase=layan-kde-git
pkgname=(layan-kde-git kvantum-theme-layan-git)
_pkgname=layan-kde
pkgver=r28.f7f205f
pkgrel=1
pkgdesc="A flat Design theme for KDE Plasma desktop"
arch=(any)
url="https://github.com/vinceliuice/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_layan-kde-git() {
    provides=('layan-kde')
    optdepends=('layan-gtk-theme: Matching GTK theme'
                'kvantum-theme-layan: Layan theme for Kvantum Qt style (recommended)'
                'tela-icon-theme: Matching icon theme')

    cd $_pkgname

    install -d "$pkgdir"/usr/share
    
    rm sddm/{README.md,install.sh}

    cp -r aurorae "$pkgdir"/usr/share
    cp -r color-schemes "$pkgdir"/usr/share
    cp -r plasma "$pkgdir"/usr/share
    cp -r sddm "$pkgdir"/usr/share
}

package_kvantum-theme-layan-git() {
    provides=('kvantum-theme-layan')
    pkgdesc="Layan theme for KDE Plasma 5"
    depends=(kvantum-qt5)

    cd $_pkgname

    install -d "$pkgdir"/usr/share

    cp -r Kvantum "$pkgdir"/usr/share
}
