# Maintainer: Mauricio Alexander Flórez <maflorezp@gmail.com>
#
# A bspwm that grew out of bspwm1 and goes its own way, built from the `local`
# branch of github.com/maflorezp/bspwm1: edge magnetism, stepped drags,
# configurable Aero Snap zones and preview, rules matched on window
# properties, four pull requests from the original bspwm and fixes for bugs
# inherited from bspwm1. Replaces the official bspwm and bspwm1.
#
# This is the PKGBUILD published on AUR. Its pkgver here is only a hint and
# may lag a release behind: the one on AUR is worked out when publishing, from
# the commit being published (see docs/maflorezp/2026-09-17-publicar-en-aur.md).

pkgname=bspwm1-maflorezp-git
_srcname=bspwm1
pkgver=1.6.3.r0.g659ee9c
pkgrel=1
pkgdesc="bspwm fork with live edge magnetism, stepped drags, configurable Aero Snap and rules matched on window properties"
arch=('x86_64')
url="https://github.com/maflorezp/bspwm1"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'libxkbcommon')
makedepends=('git')
optdepends=('sxhkd: keybinding daemon')
provides=('bspwm' 'bspwm1')
conflicts=('bspwm' 'bspwm1')
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
