# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker-git
commit=ad2b8a4
pkgver=20230402+${commit}
pkgrel=2
pkgdesc="Tweaker of ibus in gnome-shell for orientation, theme, font and input mode auto-switch."
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell>=43.0')
makedepends=('git' 'gettext' 'glib2' 'meson' 'sassc')
conflicts=('gnome-shell-extension-ibus-tweaker')
provides=('gnome-shell-extension-ibus-tweaker')
groups=('gnome-shell-extensions')
source=("git+https://github.com/tuberry/ibus-tweaker.git")
sha256sums=('SKIP')

build() {
    cd "ibus-tweaker"
    git reset --hard ${commit}
    git clean -fxd
    git submodule init
    git submodule update
    meson setup build -Dtarget=system --prefix /usr
    meson install -C build --destdir "${srcdir}"
    sed -i -E 's|^(\s*)"44"\s*$|\1"43"|g' "${srcdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com/metadata.json"
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/"
}
