# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kde-theme-git
_pkgname=sweet
pkgver=r248.802e805
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('x86_64')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
groups=()
makedepends=('git')
depends=('sweet-theme-git'
         'sweet-kvantum-theme-git'
         'sweet-folders-icons-git'
         'sweet-cursors-theme-git')
checkdepends=()
optdepends=('candy-icons: Alternative sweet icon theme')
provides=("sweet-kde-theme-git")
conflicts=('sweet-kde' 'sweet-kde-git')
options=('!strip')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname/kde
    install -d "$pkgdir"/usr/share
    
    # Workaround: https://github.com/EliverLara/Sweet/issues/78 + fix for splashscreen
    mkdir -p aurorae/themes
    mv aurorae/Sweet-Dark aurorae/themes/Sweet-Dark
    mv aurorae/Sweet-Dark-transparent aurorae/themes/Sweet-Dark-transparent
    rm aurorae/.shade.svg
    mv colorschemes color-schemes
    mkdir -p plasma/look-and-feel
    mv look-and-feel plasma/look-and-feel/Sweet
    mv sddm sddm-Sweet
    mkdir -p sddm/themes
    mv sddm-Sweet sddm/themes/Sweet

    cp -r aurorae $pkgdir/usr/share
    cp -r color-schemes $pkgdir/usr/share
    cp -r konsole $pkgdir/usr/share
    cp -r plasma $pkgdir/usr/share
    cp -r sddm $pkgdir/usr/share
}
