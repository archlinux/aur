# Maintainer: Katie Volz <iggyvolz@gmail.com>
pkgname=jetbrains-space
pkgver=2022.1.1
pkgrel=1
pkgdesc="An all-in-one collaboration solution for software development, instant communication, and team and project management."
arch=('x86_64')
url="https://jetbrains.space"
license=('proprietary')
makedepends=('squashfs-tools')
# https://search.apps.ubuntu.com/api/v1/package/space -> download_url
source=("https://api.snapcraft.io/api/v1/snaps/download/h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_30.snap")
noextract=('h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_30.snap')
sha512sums=('c15a68d48c4afb2a9e565655b7d7387cf322dc628f3e274dcbe77a57f37448c66c442167bd7c82d8873032389159306aa2950510631436e3f3325c0a812e16fa')
prepare() {
    unsquashfs -f h2GSR1wZNkxXqL4g6jfQichyULVb2ucl_30.snap
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -R "${srcdir}/squashfs-root" "${pkgdir}/opt/space"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "../../opt/space/space" "${pkgdir}/usr/bin/space"
    sed -i "s@\${SNAP}@/opt/space@" "${srcdir}/squashfs-root/meta/gui/space.desktop"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/space.desktop"  -t "${pkgdir}/usr/share/applications"
}
