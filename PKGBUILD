# Maintainer: khing <bong.kook.khan@gmail.com>

pkgname=hyde-cli-git
pkgver=v0.5.0.r43.7929e50
pkgrel=1
pkgdesc="CLI for Hyde, an Aesthetic, dynamic and minimal dots for hyprland"
arch=('any')
url="git+https://github.com/kRHYME7/Hyde-cli"
license=('GPL')
depends=( 'fzf' 'ttf-jetbrains-mono-nerd' )
provides=("${pkgname}")
conflicts=("hyprdots-ctl" "hyde-cli-git")
replaces=("hyprdots-ctl")
source=("git+https://github.com/kRHYME7/Hyde-cli#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Hyde-cli" || exit 1
    git fetch --all &> /dev/null
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"    
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/Hyde-cli" || return
    make DESTDIR="$pkgdir" clean all
}
