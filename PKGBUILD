# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-git
_gitdir=gamescope-session
pkgver=r70.3f43594
pkgrel=1
pkgdesc="Steam Big Picture Mode session based on gamescope for ChimeraOS"
arch=('any')
url="https://github.com/ChimeraOS/gamescope-session"
license=('WTFPL')
groups=()
depends=('gamescope')
optdepends=('chimera: for steam-tweaks integration'
            'frzr: chimeraos update system')
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
    mkdir -p ${pkgdir}/usr/share/polkit-1/actions
    mkdir -p ${pkgdir}/etc/pam.d
    mkdir -p ${pkgdir}/etc/systemd/system
    install -m755 usr/bin/gamescope-session ${pkgdir}/usr/bin/gamescope-session
    install -m755 usr/bin/jupiter-biosupdate ${pkgdir}/usr/bin/jupiter-biosupdate
    install -m755 usr/bin/steamos-update ${pkgdir}/usr/bin/steamos-update
    install -m755 usr/share/wayland-sessions/gamescope-session.desktop ${pkgdir}/usr/share/wayland-sessions/gamescope-session.desktop
    install -m755 usr/share/gamescope-session/device-quirks ${pkgdir}/usr/share/gamescope-session/device-quirks
    install -m755 usr/share/polkit-1/actions/org.chimeraos.update.policy ${pkgdir}/usr/share/polkit-1/actions/org.chimeraos.update.policy
    install -m644 etc/pam.d/gamescope ${pkgdir}/etc/pam.d/gamescope
    install -m644 etc/systemd/system/gamescope@.service ${pkgdir}/etc/systemd/system/gamescope@.service
}
