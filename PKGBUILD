# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=aerial-lock-git
_project=aerial-lock
pkgver=0.1.0.r0.g2f00ea1
pkgrel=1
pkgdesc='Wayland session lock with video backgrounds and an idle/session companion'
arch=('x86_64')
url='https://github.com/alexindigo/aerial-lock'
license=('GPL-3.0-or-later')
depends=('quickshell>=0.3' 'quickshell<0.4' 'qt6-mpvqml>=0.2.0'
         'qt6-5compat' 'qt6-base' 'qt6-declarative' 'pam' 'wayland'
         'bash' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'wayland-protocols')
optdepends=('curl: remote video pack downloader'
            'python: remote video pack downloader'
            'tar: remote video pack downloader'
            'procps-ng: signal-unlock examples'
            'qt6-niriqml: focused-output selection on niri'
            'systemd: aerial-idle user service and logind integration'
            'elogind: logind integration without systemd (unverified)')
provides=('aerial-lock')
conflicts=('aerial-lock')
backup=('etc/pam.d/aerial-lock')
install=aerial-lock-git.install
source=("${_project}::git+https://github.com/alexindigo/aerial-lock.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_project}"
    local description
    description=$(git describe --long --tags) || return
    printf '%s\n' "$description" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_project}"
    make PREFIX=/usr DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}

package() {
    cd "${srcdir}/${_project}"
    make install DESTDIR="$pkgdir" PREFIX=/usr DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}
