# Maintainer: Jor Bashllari <altnate2000@gmail.com>
pkgname=fmui-git
_pkgname=fmui
pkgdesc="fzf mpd user interface"
pkgver=r13.9165181
pkgrel=3
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
    for script in ./*.sh; do
        install -D -m755 "${script}" "${pkgdir}/usr/lib/$_pkgname"
    done
    install -D -m755 ./fmui "${pkgdir}/usr/lib/$_pkgname"
    ln -s "/usr/lib/$_pkgname/fmui" "${pkgdir}/usr/bin/fmui"
}
