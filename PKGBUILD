# Maintainer: fa5e4658010be730

pkgname=transformers_ocr-git
pkgver=r111.9d12573
pkgrel=1
pkgdesc="An OCR tool for manga using Transformers (maintained fork)"
arch=(any)
url="https://gitlab.com/fkzys/transformers_ocr"
license=('GPL-3.0-or-later')
depends=('python' 'python-pip' 'libnotify')
optdepends=(
    'maim: taking screenshots on Xorg'
    'xclip: copying to the clipboard on Xorg'

    'grim: taking screenshots on Wayland'
    'slurp: selecting a region on Wayland'
    'wl-clipboard: copying to the clipboard on Wayland'

    'gnome-screenshot: taking screenshots on GNOME'
    'spectacle: taking screenshots on KDE'
    'xfce4-screenshooter: taking screenshots on XFCE'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
