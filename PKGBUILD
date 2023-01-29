# Maintainer: humanbeing27 <electronneutrino27@proton.me>
_repo_name=Waydroid-Settings-gtk4-port
pkgname='waydroid-settings-git'
pkgver=r85.bac6cd8
pkgrel=4
makedepends=('blueprint-compiler' 'meson' 'git')
depends=('vte4' 'waydroid' 'webkit2gtk-5.0' 'libadwaita' 'polkit' 'python-gobject')
arch=('any')
pkgdesc="A GTK4 app to control Waydroid settings"
url="https://github.com/axel358/Waydroid-Settings/tree/gtk4-port"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url%/tree/gtk4-port}.git#branch=gtk4-port")
b2sums=('SKIP')
build(){
	arch-meson ${srcdir}/${_repo_name%-gtk4-port} build
}
pkgver() {
    cd "$srcdir/${_repo_name%-gtk4-port}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
	mkdir -p ${pkgdir}/usr
	cd ${pkgdir}/usr
	DESTDIR="$pkgdir" ninja install -C $srcdir/build
}
