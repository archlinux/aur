# Maintainer: Vincent.Ducamps <aur@ducamps.win>
pkgname=gnome-shell-extension-pop-shell
pkgdesc="Pop Shell - Tiling window management in Gnome (WIP)"
pkgver=1.1.0
pkgrel=2
_gitorg=pop-os
_gitname=shell
arch=(any)
url="https://github.com/pop-os/shell"
license=("GPLv3")
install="pop-shell.install"
optdepends=('gnome-shell-extensions: native-window extension for improved window placement')
conflicts=("gnome-shell-extension-pop-shell")
makedepends=("typescript" "git")
depends=("gnome-shell" "pop-shell-shortcuts-git")


_dir="${_gitname}-${pkgver}"
source=("${_dir}.tar.gz::https://github.com/${_gitorg}/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=("SKIP")


build() {
    cd "${srcdir}/${_dir}"
    make all
}


package() {
    cd "${srcdir}/${_dir}"
    make DESTDIR="${pkgdir}/" install
	install -Dm644 schemas/org.gnome.shell.extensions.pop-shell.gschema.xml -t \
		"$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 keybindings/*.xml -t \
		"$pkgdir/usr/share/gnome-control-center/keybindings"
    install -Dm755 scripts/configure.sh "${pkgdir}/usr/share/gnome-shell/extensions/pop-shell@system76.com/scripts/configure.sh"
}

