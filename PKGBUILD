# Maintainer: Fernando Seoane <fseoane@hotmail.com>
mypackagename=pulpo   # only if github repo has a different name than this pkgbase/pkgname
pkgname=pulpo-bin
pkgbase=pulpo-bin
pkgver=1.0      # remember to also change the version number bellow in the pkgver() function
pkgrel=4
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify and Ntfy server based on Rust."
arch=('x86_64')
url="https://github.com/fseoane/pulpo.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=()
checkdepends=()
optdepends=()
provides=(pulpo)
conflicts=(pulpo)
replaces=(pulpo)
backup=('etc/pulpo.conf' 'opt/pulpo/config/pulpo.conf')
options=()
install=
changelog=
source=("https://github.com/fseoane/pulpo/releases/download/v${pkgver}/${mypackagename}.v${pkgver}_Arch_amd64.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


package() {
	cd "${mypackagename}.${pkgver}_Arch_amd64"
	mkdir -p ${pkgdir}/opt/${mypackagename}
	mkdir -p ${pkgdir}/opt/${mypackagename}/config
	mkdir -p ${pkgdir}/opt/${mypackagename}/resources
	
	install -Dm755 --owner=root --group=users ${mypackagename} ${pkgdir}/opt/${mypackagename}/${mypackagename}
	install -Dm755 --owner=root --group=users ${mypackagename}.desktop ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	install -Dm755 --owner=root --group=users *.ogg ${pkgdir}/opt/${mypackagename}/resources
	install -Dm755 --owner=root --group=users *.png ${pkgdir}/opt/${mypackagename}/resources
	install -Dm755 --owner=root --group=users *.svg ${pkgdir}/opt/${mypackagename}/resources
	install -Dm755 --owner=root --group=users ${mypackagename}.conf ${pkgdir}/opt/${mypackagename}/config/${mypackagename}.conf
	install -Dm644 --owner=root --group=root  ${mypackagename}.conf ${pkgdir}/etc/${mypackagename}.conf

	desktop-file-install --dir=$pkgdir/usr/share/applications ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${mypackagename}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${mypackagename}/README.md"
}
