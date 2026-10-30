# Maintainer: CountMurphy <spartan.1086@gmail.com>

pkgname='invidious-companion-git'
_github_path="github.com/iv-org/invidious-companion"
_go_pkg_path="src/${_github_path}"
pkgver=release.master.127.gfcb0456
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='Companion app for invidious'
url='https://github.com/iv-org/invidious-companion'
license=('GPL')
depends=('deno')
makedepends=('git')

source=(
    "git+https://github.com/iv-org/invidious-companion"
)

sha512sums=(
    'SKIP'
)

pkgver() {
    cd invidious-companion
    git describe --tags | sed 's/^v//;s/-/./g'
}


build() {
    cd invidious-companion
    deno task compile
}

package() {
    cd $srcdir/invidious-companion
    install -Dm644 "invidious-companion.service" "${pkgdir}/usr/lib/systemd/system/invidious-companion.service"

    install -Dm755 "invidious_companion" "${pkgdir}/usr/bin/invidious-companion"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
