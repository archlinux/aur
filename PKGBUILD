pkgname=hdd_sound-git
pkgver=r9.83e34ba
pkgrel=1
pkgdesc="Play mechanical HDD sounds in Linux linked to real disk activity"
arch=('x86_64')
url="https://github.com/floriangit/hdd_sound"
license=('MIT')
depends=(libpulse)
makedepends=()
source=("git+https://github.com/floriangit/hdd_sound.git")
sha256sums=('SKIP')
_pkgname=hdd_sound

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    rm -f hdd_sound
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 hdd_sound -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
