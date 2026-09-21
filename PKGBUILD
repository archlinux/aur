# Maintainer: Mauricio Alexander Flórez <maflorezp@gmail.com>
#
# bspwm1 con los cambios de la rama `local` de github.com/maflorezp/bspwm1:
# imán de bordes, zonas y vista previa del Aero Snap, reglas por propiedades,
# cuatro PRs de bspwm original y dos arreglos de bspwm1. Sustituye al bspwm
# oficial y al bspwm1.
#
# Este es el PKGBUILD que se publica en AUR. La copia de los dotfiles es para
# compilar en caliente durante el desarrollo; ésta es la buena.

pkgname=bspwm1-maflorezp-git
_srcname=bspwm1
pkgver=1.6.2.r129.gd7f5da8
pkgrel=1
pkgdesc="bspwm1 with live edge magnetism, configurable Aero Snap and rules matched by window properties"
arch=('x86_64')
url="https://github.com/maflorezp/bspwm1"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'libxkbcommon')
makedepends=('git')
optdepends=('sxhkd: keybinding daemon')
provides=('bspwm' 'bspwm1')
conflicts=('bspwm' 'bspwm1')
# La rama `local` es la que funde todas las ramas de trabajo. Al ser un paquete
# -git, pkgver() resuelve el commit exacto en cada compilación.
source=("${_srcname}::git+${url}.git#branch=local")
sha256sums=('SKIP')

# Versión de paquete VCS: último tag, commits desde él y hash (1.6.2.r25.gabcdef0).
pkgver() {
	cd "${_srcname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_srcname}"
	make
}

package() {
	cd "${_srcname}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
