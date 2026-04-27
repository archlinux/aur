# Maintainer: fkzys <fkzys at proton dot me>

pkgname=transformers_ocr-git
pkgver=0.21.0.r0.g148d2b4
pkgrel=1
pkgdesc="An OCR tool for manga using Transformers (maintained fork)"
arch=(any)
url="https://gitlab.com/fkzys/transformers_ocr"
license=('GPL-3.0-or-later')
depends=('python')
optdepends=(
    'libx11: screen capture on X11'
    'sdl2-compat: crop/preview overlay and PNG saving'
    'sdl2_image: crop/preview overlay and PNG saving'
    'dbus: screen capture on Wayland via xdg-desktop-portal'
    'xdg-desktop-portal: screen capture on Wayland'
    'xclip: clipboard on X11'
    'wl-clipboard: clipboard on Wayland'
    'libnotify: desktop notifications'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
