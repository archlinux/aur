pkgbase=cherry-kde-git
pkgname=(cherry-kde-git kvantum-theme-cherry-git)
_pkgname=cherry-kde
pkgver=1.6.r11.g394bd03
pkgrel=1
pkgdesc="Clean, Flat, Δ Theme for KDE Plasma Desktop"
arch=('any')
url="https://github.com/nullxception/${_pkgname}"
license=('GPL3')
makedepends=('git')
conflicts=("cherry-kde-theme")
options=(!strip)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package_cherry-kde-git() {
    optdepends=('kvantum-theme-cherry-git: Cherry theme for Kvantum Qt style (recommended)')

    cd "$_pkgname"

    ./install.sh \
        --prefix="${pkgdir}/usr" \
        --clear-cache=false \
        --components=aurorae,colors,global,plasma,wallpaper
}

package_kvantum-theme-cherry-git() {
    depends=(kvantum-qt5)

    cd "$_pkgname"

    ./install.sh \
        --prefix="${pkgdir}/usr" \
        --clear-cache=false \
        --components=kvantum
}
