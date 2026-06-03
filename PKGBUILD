# Maintainer: bit-loop <isaiah.fpga@gmail.com>

_pkgname=ssh-multisession-resume
pkgname=${_pkgname}-git
_srcname=${_pkgname}-source
pkgver=0.r26.g671e4d9
pkgrel=1
pkgdesc='Persistent multi-session SSH auto-resume utility backed by tmux'
arch=('any')
url="https://github.com/Bit-Loop/${_pkgname}"
license=('MIT')
depends=('bash' 'openssh' 'tmux' 'screen')
makedepends=('git')
checkdepends=('tmux' 'screen')
optdepends=(
  'sudo: allow non-root installer runs to apply SSHD changes'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_srcname}::git+https://github.com/Bit-Loop/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}" || return

  printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
  cd "${_srcname}" || return

  env -u TMUX -u STY ./tests/smoke.sh
}

package() {
  cd "${_srcname}" || return

  . packaging/payload.sh
  payload_stage_package "$PWD" "$pkgdir" "$_pkgname" "$pkgname"
}
