# Maintainer: Jor Bashllari <altnate2000@gmail.com>
pkgname=fmui-git
_pkgname=fmui
pkgdesc="fzf mpd user interface"
pkgver=r9.78596be
pkgrel=2
arch=( 'x86_64' 'i686' 'armv7h' 'aarch64' )
url="https://github.com/seebye/fmui"
license=( 'GPL3' )
provides=($_pkgname)
conflicts=($_pkgname)
depends=( 'toilet' 'fzf' 'mpc' 'bash' 'mpd' )
optdepends=( 'cava' 'vis' )
source=("$pkgname::git+https://github.com/seebye/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/$_pkgname"
    install -D -m755 ./actions.sh "${pkgdir}/usr/lib/$_pkgname"
    install -D -m755 ./info.sh "${pkgdir}/usr/lib/$_pkgname"
    install -D -m755 ./keys.sh "${pkgdir}/usr/lib/$_pkgname"
    install -D -m755 ./fmui "${pkgdir}/usr/lib/$_pkgname"
    ln -s "${pkgdir}/usr/lib/$_pkgname/fmui" "${pkgdir}/usr/bin/fmui"
}
