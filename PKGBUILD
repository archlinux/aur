# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=aerial-lock
pkgver=0.4.0
pkgrel=1
pkgdesc='Wayland video session lock with idle integration and automatic content service'
arch=('x86_64')
url='https://github.com/atmosphera-dev/aerial-lock'
license=('GPL-3.0-or-later')
depends=('quickshell>=0.3' 'quickshell<0.4' 'qt6-mpvqml>=0.2.0'
         'qt6-5compat' 'qt6-base>=6.12' 'qt6-declarative>=6.12' 'qt6-svg>=6.12'
         'pam' 'wayland'
         'bash' 'glibc' 'libgcc' 'libstdc++' 'libxkbcommon' 'xkeyboard-config'
         'dbus' 'libarchive' 'ffmpeg')
makedepends=('cmake' 'ninja' 'qt6-shadertools>=6.12' 'wayland-protocols')
optdepends=('procps-ng: signal-unlock examples'
            'systemd: content user service, optional tray and idle/logind integration'
            'xdg-desktop-portal: settings file and folder choosers, links and desktop appearance'
            'elogind: logind integration without systemd (unverified)')
conflicts=('aerial-lock-git')
backup=('etc/pam.d/aerial-lock')
install=aerial-lock.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d645bc7681893f8dd7684f0d9f15678ac815b3317191561b787fce62c18b3a68')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr LIBEXECDIR=/usr/lib/aerial-lock DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib/aerial-lock DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}
