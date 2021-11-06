# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=styli.sh-git
pkgver=r101.232f23c
pkgrel=2
pkgdesc="wallpaper switching made easy"
arch=(any)
url="https://github.com/thevinter/styli.sh"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url"
        "${pkgname%-git}.service"
        "${pkgname%-git}.timer")
noextract=()
sha256sums=('SKIP'
            '22465fcb9402a8eaa3f104fc0f7a9461725c4c20657b4b1af248f0d4cd9a41c3'
            'd8576d3b5d4dab9e29586eaedd6e32aeaa08472ba283e6f4aa9dffd85d102abd')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -m755 -D "$srcdir/${pkgname%-git}"/${pkgname%-git} -t "$pkgdir"/usr/bin
    install -m644 -D "$startdir"/${pkgname%-git}.service -t "$pkgdir"/usr/lib/systemd/user
    install -m644 -D "$startdir"/${pkgname%-git}.timer -t "$pkgdir"/usr/lib/systemd/user
}
