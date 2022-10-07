# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=styli.sh-git
pkgver=r114.9535177
pkgrel=1
pkgdesc="wallpaper switching made easy"
arch=(any)
url="https://github.com/thevinter/styli.sh"
license=('GPL')
groups=()
depends=('wget' 'curl' 'coreutils' 'gawk' 'sed' 'jq')
optdepends=(
    'feh: for displaying wallpaper'
    'nitrogen: for setting wallpaper'
    'python-pywal: something with colorschemes'
)
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
            '609cb72db3888cceb6472b06783bffbb9e3d18ab23cb75ca0ee93371b88d067d'
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
