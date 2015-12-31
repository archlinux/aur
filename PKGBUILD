# Maintainer: Julien Savard <juju at juju2143 dot ca>
pkgname=cemu-git
pkgver=0.2
pkgrel=1
pkgdesc="An open-source third-party TI-84 Plus CE / TI-83 Premium CE calculator emulator"
arch=("i686" "x86_64")
url="https://github.com/MateoConLechuga/CEmu"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-declarative')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("cemu")
conflicts=("cemu")
replaces=()
backup=()
options=()
install=
source=('cemu::git+https://github.com/MateoConLechuga/CEmu' 'cemu.desktop')
noextract=()
md5sums=('SKIP'
         '3b347a05abc3d1a3a047a68988c659b7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(cat CEmu.pro | grep CEMU_VERSION | grep -o '[^=]*$')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake-qt5 -r CEmu.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 "${srcdir}/${pkgname%-git}/CEmu" "$pkgdir/usr/bin/cemu"
	install -D -m644 "${srcdir}/${pkgname%-git}/README.md" "$pkgdir/usr/share/${pkgname%-git}/README"
	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname%-git}/resources/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m644 "${srcdir}/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
