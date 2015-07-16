##
# Maintainer: pyamsoft <pyam.soft@gmail.com>
##

pkgname=pstate-frequency-git
_gitname=pstate-frequency
pkgdesc="Easily control Intel p-state driver (git version)"
pkgver=1.2.9.git
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils')
optdepends=('x86_energy_perf_policy')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
sha256sums=('SKIP')
source=("${_gitname}::git+${url}#branch=dev")

###############################################################################

##
# Please read config.mk for an explanation
# of the variable options in this file
##

##
# DEFAULTS
# _CXX="g++"
# _PREFIX="/usr/local"
# _INCLUDE_BASH_COMPLETION=1
# _INCLUDE_ZSH_COMPLETION=0
# _INCLUDE_UDEV_RULE=0
# _INCLUDE_SYSTEMD_UNIT=1
# _X86_PERF_POLICY_POWERSAVE=0
##

_CXX="g++"
_PREFIX="/usr"
_INCLUDE_BASH_COMPLETION=1
_INCLUDE_ZSH_COMPLETION=0
_INCLUDE_UDEV_RULE=0
_INCLUDE_SYSTEMD_UNIT=1
_INCLUDE_DOC=1
_INCLUDE_SRC=1
_X86_PERF_POLICY_POWERSAVE=0

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(awk -F '=' '{if (/^VERSION:=/) {print $2}}' 'config.mk').git"
}

prepare() {
	cd "$srcdir/$_gitname"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		X86_PERF_POLICY_POWERSAVE=${_X86_PERF_POLICY_POWERSAVE} \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC} \
		options
}

build() {
	cd "$srcdir/$_gitname"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		X86_PERF_POLICY_POWERSAVE=${_X86_PERF_POLICY_POWERSAVE} \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC}
}

package() {
	cd "$srcdir/$_gitname"
	make \
		DESTDIR="$pkgdir" \
		CXX="${_CXX}" \
		PREFIX="${_PREFIX}" \
		X86_PERF_POLICY_POWERSAVE=${_X86_PERF_POLICY_POWERSAVE} \
		INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
		INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
		INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
		INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
		INCLUDE_DOC=${_INCLUDE_DOC} \
		INCLUDE_SRC=${_INCLUDE_SRC} \
		install
}

