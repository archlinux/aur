# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="linux-timemachine-git"
pkgdesc="Rsync-based OSX-like time machine for atomic and resumable local and remote backups"
url="https://github.com/cytopia/linux-timemachine"

conflicts=("linux-timemachine")
provides=("linux-timemachine")

pkgver=1.3.2.r0.gbc947eb
pkgrel=1

arch=("any")
license=("MIT")

makedepends=("git")
depends=("rsync")
optdepends=("openssh: backup to remote (SCP) locations")

source=("${pkgname}::git+https://github.com/cytopia/linux-timemachine.git")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"

    install \
        -Dm755 \
        timemachine \
        "${pkgdir}/usr/bin/timemachine"

    install \
        -Dm644 \
        LICENSE.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
