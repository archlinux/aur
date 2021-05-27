# Maintainer: Ryan King <ryan.spencer.king@pm.me>
# Contributors: Tuomo Syvänperä @syvanpera(GitHub)
pkgname=xmonad-cinnamon-git
pkgver=r2.cd41608
pkgrel=1
pkgdesc="Starts xmonad inside a cinnamon session."
arch=('any')
url="https://github.com/syvanpera/xmonad-cinnamon.git"
license=('MIT')
depends=('xmonad' 'cinnamon-session' 'cinnamon-settings-daemon')
optdepends=('gdm: Recommended display manager'
            'lightdm: Recommended display manager')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/syvanpera/xmonad-cinnamon.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
        install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
