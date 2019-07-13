# Submitter: Dknight
# Contributor: Maksim Sipos <msipos@mailc.net>
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=faddeeva
pkgname=octave-$_pack
pkgver=0.0.1
pkgrel=1
pkgdesc="Faddeeva functions for Octave."
arch=(any)
url="http://ab-initio.mit.edu/Faddeeva-octave.tgz"
license=('LGPLv2')
depends=('octave>=4.0.0' 'octave-io>=1.0.18')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=http://ab-initio.mit.edu/Faddeeva-octave.tgz
source=("http://ab-initio.mit.edu/Faddeeva-octave.tgz")
noextract=("$_archive")
sha256sums=('0bd94e874fb1d37f35c022129c033535a1456f1efb477f5fba9017883b7b088d')

_octave_run() {
	octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
	src=$1
	dst=$2
	cd "$srcdir"
	mkdir -p "$(dirname "$dst")"
	cp -rT "$src" "$dst"
}

build() {
	_prefix="$srcdir"/install_prefix
	_archprefix="$srcdir"/install_archprefix
	mkdir -p "$_prefix" "$_archprefix"
	cd "$srcdir"
	cd Faddeeva-octave
	make
}


package() {
	prefix=$pkgdir/`octave-config --print OCTFILEDIR`
	archprefix=$pkgdir/`octave-config --print OCTFILEDIR`
	_install_dir "$srcdir"/install_prefix "$prefix"
	_install_dir "$srcdir"/install_archprefix "$archprefix"
	cd "$srcdir"
	cd Faddeeva-octave
	cp -f Faddeeva_w.oct Faddeeva_erf.oct Faddeeva_erfc.oct Faddeeva_erfi.oct Faddeeva_erfcx.oct Faddeeva_Dawson.oct $pkgdir/`octave-config --print OCTFILEDIR`
}
