pkgbase=cherry-kde-git
pkgname=(cherry-kde-git kvantum-theme-cherry-git)
_pkgname=cherry-kde
pkgver=2.1.r0.gc6d4082
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
    optdepends=('kvantum-theme-cherry-git: Cherry theme for Kvantum (recommended)')

    cd "$_pkgname"

    ./install.sh \
        --prefix="${pkgdir}/usr" \
        --clear-cache=false \
        --components=aurorae,colors,global,plasma,wallpaper
}

package_kvantum-theme-cherry-git() {
    depends=(kvantum-qt5)
    pkgdesc="Cherry theme for Kvantum"

    cd "$_pkgname"

    ./install.sh \
        --prefix="${pkgdir}/usr" \
        --clear-cache=false \
        --components=kvantum
}
