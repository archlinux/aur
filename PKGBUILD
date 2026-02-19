# Maintainer: taotieren <admin@taotieren.com>

pkgname=ingress-missionday-wallpapers
pkgver=r2.ad3ff09
pkgrel=1
pkgdesc="Ingress MissionDay Wallpapers (Ingress 任务天壁纸)"
arch=(any)
url="https://github.com/taotieren/ingress-missionday-wallpapers"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=(
    git
)
optdepends=('wallutils: support the simple timed wallpaper format')
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -Dm0644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 -t "$pkgdir/usr/share/gnome-background-properties/" ingress-missionday-backgrounds.xml
    install -Dm644 -t "$pkgdir/usr/share/backgrounds/ingress-missionday/" ingress-missionday.stw 
    install -Dm644 -t "$pkgdir/usr/share/backgrounds/ingress-missionday/" 2026/*
}
