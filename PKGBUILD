_name='focused-window-dbus'
pkgname="gnome-shell-extension-$_name-git"
pkgver=r15.89ab6fc
pkgrel=1
pkgdesc="Allows you to get the currently focused window using a D-Bus call"
arch=('any')
url="https://github.com/flexagoon/$_name"
license=('MIT')

depends=(
    'gnome-shell>=1:43.0-1'
)
makedepends=(
    git
)
provides=(gnome-shell-extension-${_name})
conflicts=(
    gnome-shell-extension-${_name}
)

source=("${_name}::git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_name}"
    _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
    find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
}

