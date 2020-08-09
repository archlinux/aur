# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=mon2cam-git
_pkgname=Mon2Cam
pkgver=r43.e0a319b
pkgrel=1
pkgdesc="Workaround for multi-monitor Discord screensharing"
arch=("any")
url="https://github.com/ShayBox/$_pkgname"
license=("MIT")
depends=(
    "deno"
    "xorg-xrandr"
    "ffmpeg"
    "v4l2loopback-dkms"
)
makedepends=(
    "git"
    "deno"
)
optdepends=(
    "wf-recorder: wlroots compositor (wayland) support"
)
provides=("mon2cam")
source=(
    "git+$url.git"
"shebang"
)
sha256sums=(
    "SKIP"
    "1174500c3fa06a04215189c9a9b6e334456c97fc962cc63c4ad6eee6bb215e98"
)

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    
    deno bundle --unstable src/mod.ts > "$_pkgname.ts"
    cat "$srcdir/shebang" "$_pkgname.ts" > "$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
