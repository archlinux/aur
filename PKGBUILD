# Maintainer: PharmaRacist
pkgname=noon-main
pkgver=2.1.r0.g1234567
pkgrel=1
pkgdesc="PharmaRacist's Perspective of a Desktop - Main package"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'noon-apps'
    'noon-dev'
    'noon-hyprland'
    'noon-python'
    'noon-services'
    'noon-looks'
    'noon-utils'
    'ntfs-3g'
    'uv'
    'git'
)
makedepends=('git')
optdepends=(
    'noon-nvidia: NVIDIA GPU support'
    'noon-nvidia-legacy: Legacy NVIDIA GPU support'
)
install=noon-main.install
source=("git+https://github.com/PharmaRacist/Noon.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Noon"
    printf "2.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/Noon"
    
    install -dm755 "$pkgdir/opt/noon"
    cp -r dots setup_data setup.sh "$pkgdir/opt/noon/"
    chmod +x "$pkgdir/opt/noon/setup.sh"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/noon/setup.sh" "$pkgdir/usr/bin/noon"
}
