 
# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=checksum-blister-kde-service-menu-git
provides=(checksum-blister-kde-service-menu)
pkgver=v2.1.r0.g44290fc
pkgrel=1
pkgdesc="sha256/sha512/sha1/md5 checksums in dolphin right-click menu"
arch=('any')
url="https://github.com/KVAnton-WEB/Checksum-Blister"
license=('GPLv3')
depends=('dolphin' 'libnotify' 'xsel')
makedepends=('git')

source=("${pkgname}::git+https://github.com/KVAnton-WEB/Checksum-Blister.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  # Cf. https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m0755 -t "${pkgdir}/usr/local/bin" \
    "checksum_blister"
  install -D -m0755 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/" \
    "checksum_blister.desktop"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
