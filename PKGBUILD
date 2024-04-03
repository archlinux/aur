# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgbase=arc-kde
pkgname=(arc-kde plasma5-themes-arc kvantum-theme-arc)
pkgver=20220908
pkgrel=3
pkgdesc="Arc theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=(GPL3)
options=(!strip)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('bb4f547df20fc43fc19315cd0c96a447068abdc4095e7ae8b654a813e3422e93')
optdepends=(
  'arc-gtk-theme: Arc theme for GTK apps'
  'arc-icon-theme: Arc icon theme'
)

package_arc-kde() {
    pkgdesc='Arc theme for Plasma 5 - Transitional package (install "plasma5-themes-arc")'
    depends=('plasma5-themes-arc')
}

# New package name using:
# https://wiki.archlinux.org/title/KDE_package_guidelines#KF5_package_naming
package_plasma5-themes-arc() {
    optdepends+=('kvantum-theme-arc: Arc theme for Kvantum Qt style (recommended)')
    provides=('arc-kde')
    replaces=('arc-kde')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir IGNORE=Kvantum make install
}

package_kvantum-theme-arc() {
    pkgdesc="Arc theme for Kvantum"
    depends=('kvantum')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir THEMES=Kvantum make install
}
