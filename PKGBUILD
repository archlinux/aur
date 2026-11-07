# Maintainer: Antonios Rainakis <antonyrai26@gmail.com>
pkgname=unios-update-git
_pkgname=unios-update
pkgver=r901.2bfcc49
pkgrel=1
pkgdesc="An update notifier and applier for UniOS with a systray applet and CLI"
arch=('x86_64')
url="https://github.com/open-source-uom/unios-update"
license=('GPL-3.0-or-later')

depends=(
  'bash'
  'curl'
  'diffutils'
  'fakeroot'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'htmlq'
  'libgcc'
  'pacman'
  'pacman-contrib'
  'archlinux-contrib'
  'systemd'
  'util-linux'
  'xdg-utils'
)

makedepends=(
  'cargo'
  'make'
  'pkgconf'
  'scdoc'
  'git'
)

checkdepends=(
  'bats'
)

optdepends=(
  'flatpak: Flatpak packages support'
  'libnotify: Desktop notifications on new updates'
  'alhp-utils: Check for ALHP build queue or outdated mirrors'
  'sudo: Privilege elevation'
  'sudo-rs: Alternative privilege elevation'
  'opendoas: Alternative privilege elevation'
  'vim: Default diff tool for pacdiff'
  'neovim: Diff tool for pacdiff if EDITOR=nvim'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
  cd "$_pkgname"
  unset CARGO_TARGET_DIR
  make PREFIX=/usr
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
