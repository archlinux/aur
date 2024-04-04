# Maintainer: khing <bong.kook.khan@gmail.com>

pkgname=hyprdots-ctl-git
pkgver=v0.5.0.r43.7929e50
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations, Warning, this package has been renames to Hyde-cli"
arch=('any')
url="git+https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
provides=("${pkgname}")
conflicts=("hyprdots-ctl" "hyde-cli-git")
replaces=("hyprdots-ctl" "hyde-cli-git")
source=("git+https://github.com/kRHYME7/Hyde-cli#branch=hyprdots-ctl-old")
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
