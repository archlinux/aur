# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=wlr-layout-ui
pkgver=1.6.11
pkgrel=1
pkgdesc="GUI to configure your screens"
arch=(any)
url="https://github.com/fdev31/wlr-layout-ui"
license=('MIT')
groups=()
depends=('python' 'python-pyglet' 'python-tomli-w' 'python-tomli')
optdepends=('wlr-randr: To apply the configuration on other wlroots systems'
    'hyprland: To apply the configuration on Hyprland (recommended)',
    'xorg-xrandr: To apply the configuration on X11')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/fdev31/wlr-layout-ui.git#tag=${pkgver}")
noextract=()
md5sums=('835e529ef2a945b3b145465c55defaea')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git checkout ${pkgver}
    printf "%s" "$(git describe --tags)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/wlr-layout-ui/files/wlr-layout-ui.desktop"\
            "${pkgdir}/usr/share/applications/wlr-layout-ui.desktop"
}
