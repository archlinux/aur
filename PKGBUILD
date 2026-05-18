# Maintainer: Ostoja <ostoja@sredojevic.net>
pkgname=chromatix-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Chromatix is a desktop music player for Plex and Jellyfin that transforms your listening experience and makes interacting with your music libraries a joy."
arch=('x86_64' 'aarch64')
url="https://github.com/chromatix-app/chromatix-release"
provides=('chromatix')
conflicts=('chromatix')
options=('!debug')
source=("chromatix.sh")
source_x86_64=("Chromatix-${pkgver}-amd64.deb::https://github.com/chromatix-app/chromatix-release/releases/download/v${pkgver}/Chromatix-${pkgver}-amd64.deb")
source_aarch64=("Chromatix-${pkgver}-arm64.deb::https://github.com/chromatix-app/chromatix-release/releases/download/v${pkgver}/Chromatix-${pkgver}-arm64.deb")
sha256sums=('ec4e803fd0020fbd847ab182e8dd012d9f09d58e83ba99af77c726edb41e52bf')
sha256sums_x86_64=('a86f794b3a8134903009d27fe74fa919186353d64f64ac45366a0a0566bf4cd3')
sha256sums_aarch64=('2c99b725828e102922c9a41bb0d0376ea824c4dec862be7244d3eba8497bc14a')

package() {
    # Extract deb package
    local deb_arch
    case "$CARCH" in
        x86_64) deb_arch=amd64 ;;
        aarch64) deb_arch=arm64 ;;
        *)
            printf 'Unsupported arch: %s\n' "$CARCH" >&2
            return 1
            ;;
    esac

    ar p "${srcdir}/Chromatix-${pkgver}-${deb_arch}.deb" data.tar.xz | tar xJ -C "${pkgdir}"

    install -Dm755 "${srcdir}/chromatix.sh" "${pkgdir}/usr/bin/chromatix"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
