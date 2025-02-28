# Maintainer: Mohamed Feddad <mrf345@gmail.com>

pkgname=kitty-album-git
pkgver=r2.c0f485b
pkgrel=1
pkgdesc="Minimal kitten to sift through images intuitively in kitty"
arch=('any')
url="https://github.com/mrf345/kitty-album/"
license=('GPL3')
source=('git+https://github.com/mrf345/kitty-album/' 'kitty-album.desktop')
depends=('kitty' 'python' 'imagemagick')
makedepends=('git')
provides=("kitty-album")
sha256sums=('SKIP' 'c268539f315f70d385574ed20e46d73d094005de96bd0ee3c887159bed90522c')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 album.py "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
