##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency-git
_gitname=pstate-frequency
pkgdesc="Easily control Intel p-state driver (git version)"
pkgver=2.0.0.r459.996dc23
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils' 'grep')
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
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
# _CC="g++"
# _PREFIX="/usr/local"
# _INCLUDE_BASH_COMPLETION=1
# _INCLUDE_ZSH_COMPLETION=0
# _INCLUDE_DOC=1
# _INCLUDE_SRC=1
# _INCLUDE_LICENSE=1
# _INCLUDE_UDEV_RULE=1
# _INCLUDE_SYSTEMD_UNIT=1
# _X86_ENERGY_PERF_POLICY=1
# _PRESET_POWER_PLAN_MAX_PERFORMANCE="100 100 0 performance"
# _PRESET_POWER_PLAN_PERFORMANCE="100 0 1 powersave"
# _PRESET_POWER_PLAN_POWERSAVE="0 0 1 powersave"
# _AUTO_POWER_PLAN_AC="performance"
# _AUTO_POWER_PLAN_BAT="powersave"
##

_CC="gcc"
_PREFIX="/usr"
_INCLUDE_BASH_COMPLETION=1
_INCLUDE_ZSH_COMPLETION=0
_INCLUDE_UDEV_RULE=1
_INCLUDE_SYSTEMD_UNIT=1
_INCLUDE_DOC=1
_INCLUDE_SRC=1
_INCLUDE_LICENSE=1
_X86_ENERGY_PERF_POLICY=1
_PRESET_POWER_PLAN_MAX_PERFORMANCE="100 100 0 performance"
_PRESET_POWER_PLAN_PERFORMANCE="100 0 1 powersave"
_PRESET_POWER_PLAN_POWERSAVE="0 0 1 powersave"
_AUTO_POWER_PLAN_AC="performance"
_AUTO_POWER_PLAN_BAT="powersave"

pkgver() {
        cd "$srcdir/$_gitname"
        printf "%s.r%s.%s" "$(awk -F '=' '{if (/^VERSION:=/) {print $2}}' 'config.mk')" \
                "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/$_gitname"
        make \
                DESTDIR="$pkgdir" \
                CC="${_CC}" \
                PREFIX="${_PREFIX}" \
                X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
                INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
                INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
                INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
                INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
                INCLUDE_DOC=${_INCLUDE_DOC} \
                INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
                INCLUDE_SRC=${_INCLUDE_SRC} \
                PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
                AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
                AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\"" \
                options
}

build() {
        cd "$srcdir/$_gitname"
        make \
                DESTDIR="$pkgdir" \
                CC="${_CC}" \
                PREFIX="${_PREFIX}" \
                X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
                INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
                INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
                INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
                INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
                INCLUDE_DOC=${_INCLUDE_DOC} \
                INCLUDE_SRC=${_INCLUDE_SRC} \
                INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
                PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
                AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
                AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\""
}

package() {
        cd "$srcdir/$_gitname"
        make \
                DESTDIR="$pkgdir" \
                CC="${_CC}" \
                PREFIX="${_PREFIX}" \
                X86_ENERGY_PERF_POLICY=${_X86_ENERGY_PERF_POLICY} \
                INCLUDE_BASH_COMPLETION=${_INCLUDE_BASH_COMPLETION} \
                INCLUDE_ZSH_COMPLETION=${_INCLUDE_ZSH_COMPLETION} \
                INCLUDE_UDEV_RULE=${_INCLUDE_UDEV_RULE} \
                INCLUDE_SYSTEMD_UNIT=${_INCLUDE_SYSTEMD_UNIT} \
                INCLUDE_DOC=${_INCLUDE_DOC} \
                INCLUDE_SRC=${_INCLUDE_SRC} \
                INCLUDE_LICENSE=${_INCLUDE_LICENSE} \
                PRESET_POWER_PLAN_MAX_PERFORMANCE="\"${_PRESET_POWER_PLAN_MAX_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_PERFORMANCE="\"${_PRESET_POWER_PLAN_PERFORMANCE}\"" \
                PRESET_POWER_PLAN_POWERSAVE="\"${_PRESET_POWER_PLAN_POWERSAVE}\"" \
                AUTO_POWER_PLAN_AC="\"${_AUTO_POWER_PLAN_AC}\"" \
                AUTO_POWER_PLAN_BAT="\"${_AUTO_POWER_PLAN_BAT}\"" \
                install
}
