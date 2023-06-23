# Maintainer: Fernando Seoane <fseoane@hotmail.com>
mypackagename=pyNotify   # only if github repo has a different name than this pkgbase/pkgname
pkgname=pynotify-git
pkgbase=pynotify-git
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify server."
arch=('x86_64')
url="https://github.com/fseoane/pyNotify.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=('git' 'python3' 'python-pip')
checkdepends=()
optdepends=()
provides=(pyNotify)
conflicts=(pyNotify)
replaces=(pyNotify)
backup=('etc/pyNotify.conf' 'opt/pyNotify/pyNotify.conf')
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
	cd "$mypackagename"
	printf "0.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$mypackagename"
 	echo "$pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" > pyNotify.ver
}

build() {

	cd "$mypackagename"
	sh build.4.AUR.sh
}

package() {
	cd "$mypackagename"
	sudo mkdir -p ${pkgdir}/opt/${mypackagename}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/dist/${mypackagename} ${pkgdir}/opt/${mypackagename}/${mypackagename}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.desktop ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.ogg ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.png ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.svg ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.ver ${pkgdir}/opt/${mypackagename}/${mypackagename}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.conf ${pkgdir}/opt/${mypackagename}/${mypackagename}.conf
	sudo install -Dm644 --owner=root --group=root ${srcdir}/${mypackagename}/${mypackagename}.conf ${pkgdir}/etc/${mypackagename}.conf


	desktop-file-install --dir=$HOME/.local/share/applications ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${mypackagename}/LICENSE"
	sudo install -Dm644 README.md "${pkgdir}/usr/share/doc/${mypackagename}/README.md"
}
