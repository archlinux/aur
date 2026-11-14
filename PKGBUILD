# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=aerial-lock
pkgver=0.1.2
pkgrel=1
pkgdesc='Wayland session lock with video backgrounds and an idle/session companion'
arch=('x86_64')
url='https://github.com/atmosphera-dev/aerial-lock'
license=('GPL-3.0-or-later')
depends=('quickshell>=0.3' 'quickshell<0.4' 'qt6-mpvqml>=0.2.0'
         'qt6-5compat' 'qt6-base' 'qt6-declarative' 'pam' 'wayland'
         'bash' 'glibc' 'libgcc' 'libstdc++')
makedepends=('wayland-protocols')
optdepends=('curl: remote video pack downloader'
            'python: remote video pack downloader'
            'tar: remote video pack downloader'
            'procps-ng: signal-unlock examples'
            'qt6-niriqml: focused-output selection on niri'
            'systemd: aerial-idle user service and logind integration'
            'elogind: logind integration without systemd (unverified)')
conflicts=('aerial-lock-git')
backup=('etc/pam.d/aerial-lock')
install=aerial-lock.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8613af06b326721d31277fa1daa4654ef400669a96893cddad62249bc7937a7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir" PREFIX=/usr DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}
