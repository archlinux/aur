# Maintainer: fkzys <fkzys at proton dot me>

pkgname=transformers_ocr-git
pkgver=2a7c3c4
pkgrel=1
GITFLAGS=('--depth=0')
pkgdesc="An OCR tool for manga using Transformers (maintained fork)"
arch=(any)
url="https://github.com/fkzys/transformers_ocr"
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
    git describe --tags --always --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
