# Maintainer: Ayrton Sparling <ayrton@sparling.us>
_pkgname=lightdm-webkit2-material2
pkgname=lightdm-webkit2-theme-material2-git
pkgdesc="A material design LightDM theme for lightdm-webkit2-greeter from the latest git"
pkgver=r15.2e21881
pkgrel=1
arch=('any')
url="https://github.com/FallingSnow/${_pkgname}"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
makedepends=('npm' 'nodejs')
conflicts=('lightdm-webkit2-theme-material2')
source=("git+https://github.com/FallingSnow/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    npm install
}

build() {
    cd "$srcdir/$_pkgname"
    npm run build
}

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/$_pkgname/build/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
