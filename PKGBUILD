# Maintainer: nagyation  <mnagy1312@gmail.com>
pkgname=focus-git
_newpkgname=Focus
pkgver=r52.c5e651b
pkgrel=1
pkgdesc="A desktop notification based app that keeps you focused by notifying you of what you should be doing"
arch=(x86_64)
url="https://github.com/nagyation/Focus"
license=('GPL')
depends=('gtk2' 'libnotify' 'libappindicator-gtk3' 'gtk-update-icon-cache')
makedepends=('git')
source=("git+https://github.com/nagyation/Focus.git")
md5sums=('SKIP')

pkgver() {
        cd "$_newpkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$_newpkgname"
        make
}

package() {
        cd "$_newpkgname"
        install -D -m644 "License.txt" "${pkgdir}/usr/share/licenses/${_newpkgname}/LICENSE"
        install -D -m755 "focus" "${pkgdir}/usr/bin/focus"
        install -D -m755 "icons/focus-icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/focus-icon.svg"
	sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor	
}
