# Maintainer: Katie Volz <iggyvolz@gmail.com>
pkgname=jetbrains-space
pkgver=2022.1.0
pkgrel=1
pkgdesc="An all-in-one collaboration solution for software development, instant communication, and team and project management."
arch=('x86_64')
url="https://jetbrains.space"
license=('proprietary')
makedepends=('squashfs-tools')
# https://search.apps.ubuntu.com/api/v1/package/space -> download_url
source=("https://api.snapcraft.io/api/v1/snaps/download/h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_29.snap")
noextract=('h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_29.snap')
sha512sums=('6873526e0e9fb1e40d50bca971bd4faa7e682b1696112a6df9e76b7083e6f648c30bf0a9d8450402ca791a24a5c5155dff64a71fde7f7435509d44337fda080e')
prepare() {
    unsquashfs -f h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_29.snap
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -R "${srcdir}/squashfs-root" "${pkgdir}/opt/space"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "../../opt/space/space" "${pkgdir}/usr/bin/space"
    sed -i "s@\${SNAP}@/opt/space@" "${srcdir}/squashfs-root/meta/gui/space.desktop"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/space.desktop"  -t "${pkgdir}/usr/share/applications"
}
