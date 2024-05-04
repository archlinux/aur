# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=wlr-layout-ui-git
pkgver=r79.7aecc75
pkgrel=3
pkgdesc="GUI to configure your screens"
arch=(any)
url="https://github.com/fdev31/wlr-layout-ui"
license=('MIT')
groups=()
depends=('python' 'python-pyglet' 'python-tomli-w' 'python-tomli')
optdepends=('wlr-randr: To apply the configuration on other wlroots systems'
    'hyprland: To apply the configuration on Hyprland (recommended)',
    'xrandr: To apply the configuration on X11')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/fdev31/wlr-layout-ui.git#branch=main")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
