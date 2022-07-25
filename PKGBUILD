# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-git
_gitdir=gamescope-session
pkgver=r57.8e1a336
pkgrel=1
pkgdesc="Steam Big Picture Mode session based on gamescope for ChimeraOS"
arch=('any')
url="https://github.com/ChimeraOS/gamescope-session"
license=('WTFPL')
groups=()
depends=('gamescope')
optdepends=('chimera: for steam-tweaks integration')
makedepends=('git')
install=gamescope-session.install
source=("${_gitdir}::git+https://github.com/ChimeraOS/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/wayland-sessions
    mkdir -p ${pkgdir}/usr/share/gamescope-session
    mkdir -p ${pkgdir}/etc/pam.d
    mkdir -p ${pkgdir}/etc/systemd/system
    install -m755 usr/bin/gamescope-session ${pkgdir}/usr/bin/gamescope-session
    install -m755 usr/share/wayland-sessions/gamescope-session.desktop ${pkgdir}/usr/share/wayland-sessions/gamescope-session.desktop
    install -m755 usr/share/gamescope-session/device-quirks ${pkgdir}/usr/share/gamescope-session/device-quirks
    install -m644 etc/pam.d/gamescope ${pkgdir}/etc/pam.d/gamescope
    install -m644 etc/systemd/system/gamescope@.service ${pkgdir}/etc/systemd/system/gamescope@.service
}
