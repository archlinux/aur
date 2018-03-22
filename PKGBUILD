# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Noeljnuior <liamgliamgmailcom>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme-git
_pkgname=arc-theme
pkgname=("arc-gtk-theme-git" "arc-solid-gtk-theme-git")
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=20180114.r5.906add8
pkgrel=1
arch=("any")
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/horst3180/arc-theme/issues/840
url="https://github.com/nicohood/${_pkgname}"
license=("GPL3")
optdepends=("arc-icon-theme: recommended icon theme"
            "gtk-engine-murrine: for gtk2 themes"
            "gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc")

source=("git+https://github.com/nicohood/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    cp -a ${_pkgname}{,-solid}
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh --prefix=/usr

    cd "${srcdir}/${_pkgname}-solid"
    ./autogen.sh --prefix=/usr --disable-transparency
}

package_arc-gtk-theme-git() {
    replaces=("gtk-theme-arc-git")

    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}

package_arc-solid-gtk-theme-git() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=("gtk-theme-arc-solid-git")

    cd ${_pkgname}-solid
    make DESTDIR="${pkgdir}" install
}
