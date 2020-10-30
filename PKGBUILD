# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.4.4
pkgrel=1
pkgdesc="Wlroots based Phone compositor"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=(mutter
         wlroots)
makedepends=(ctags
             libhandy
             meson
             vala)
checkdepends=(xorg-server-xvfb)
source=("https://source.puri.sm/Librem5/phoc/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('49e418ebe0389d325a53306e538947d71f9fdce5bdd0ba3675c05e6b0577ea64')

build() {
    arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
    meson compile -C build
}

check() {
    dbus-run-session xvfb-run \
        -s '-screen 0 1920x1080x24 -nolisten local' \
        meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
