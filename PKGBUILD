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
provides=('kitty-album' 'kitty_album.py')
sha256sums=('SKIP' '67ce76f8fb3b711db62c8aff3f5592baab70852095351db0c93b4eda18b11746')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 album.py "$pkgdir/usr/bin/kitty_album.py"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
