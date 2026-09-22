# Maintainer: Mauricio Alexander Flórez <maflorezp@gmail.com>
#
# bspwm-ng, the continuation of bspwm, built from the `local` branch of
# github.com/maflorezp/bspwm-ng: edge magnetism, stepped drags, configurable
# Aero Snap zones and preview, rules matched on window properties, four pull
# requests from the original bspwm and fixes for bugs inherited from bspwm1.
# Replaces the official bspwm, bspwm1 and this package's old name,
# bspwm1-maflorezp-git. The binaries are still bspwm and bspc.
#
# This is the PKGBUILD published on AUR. Its pkgver here is only a hint and
# may lag a release behind: the one on AUR is worked out when publishing, from
# the commit being published (see docs/maflorezp/2026-09-17-publicar-en-aur.md).

pkgname=bspwm-ng-git
_srcname=bspwm-ng
pkgver=1.6.3.r2.g4e6da37
pkgrel=1
pkgdesc="bspwm fork with live edge magnetism, stepped drags, configurable Aero Snap and rules matched on window properties"
arch=('x86_64')
url="https://github.com/maflorezp/bspwm-ng"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'libxkbcommon')
makedepends=('git')
optdepends=('sxhkd: keybinding daemon')
provides=('bspwm' 'bspwm1')
conflicts=('bspwm' 'bspwm1' 'bspwm1-maflorezp-git')
replaces=('bspwm1-maflorezp-git')
# `local` is the main branch. Being a -git package, pkgver() works out the
# exact commit on every build.
source=("${_srcname}::git+${url}.git#branch=local")
sha256sums=('SKIP')

# VCS package version: last tag, commits since it and hash (1.6.3.r0.gabcdef0).
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
