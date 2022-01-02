# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-git
_gitdir=gamescope-session
pkgver=r21.850ada5
pkgrel=1
pkgdesc="Steam Big Picture Mode session based on gamescope for ChimeraOS"
arch=('any')
url="https://github.com/Samsagax/gamescope-session"
license=('WTFPL')
groups=()
depends=('gamescope')
optdepends=('chimera: for steam-tweaks integration')
makedepends=('git')
install=gamescope-session.install
source=("${_gitdir}::git+https://github.com/Samsagax/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/etc/pam.d
    mkdir -p ${pkgdir}/etc/systemd/system
    install -m755 usr/bin/gamescope-session ${pkgdir}/usr/bin/gamescope-session
    install -m644 etc/gamescope-session.conf ${pkgdir}/etc/gamescope-session.conf
    install -m644 etc/pam.d/gamescope ${pkgdir}/etc/pam.d/gamescope
    install -m644 etc/systemd/system/gamescope@.service ${pkgdir}/etc/systemd/system/gamescope@.service
}
