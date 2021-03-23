# Maintainer: Kyle Laker <kyle+aur at laker dot email>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_basepkg="lightdm-webkit-theme-litarvan"
pkgname="${_basepkg}-git"
pkgver=3.1.0.r22.g775b717
pkgrel=1
pkgdesc='Modern and full-featured LightDM theme'
arch=('any')
_github="github.com/Litarvan/$_basepkg"
url="https://$_github"
license=('BSD')
depends=('lightdm-webkit2-greeter')
conflicts=("$_basepkg")
provides=("$_basepkg")
makedepends=('git' 'npm')
source=("$pkgname::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    ./build.sh
}

package() {
    cd "$pkgname/dist"

    install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/litarvan
    cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/litarvan/

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
