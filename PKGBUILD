# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=spotube-nightly-bin
pkgver=5.0.0
pkgrel=4
epoch=
pkgdesc="🎧 Open source music client! Available for both desktop & mobile!"
arch=(x86_64 aarch64)
url="https://spotube.krtirtho.dev"
license=('BSD-4')
groups=()
depends=('mpv' 'libappindicator-gtk3' 'libsecret' 'jsoncpp' 'libnotify' 'xdg-user-dirs' 'webkit2gtk-4.1')
makedepends=()
checkdepends=()
optdepends=('yt-dlp-git')
provides=(spotube)
conflicts=(spotube)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(spotube-linux-nightly-$pkgver-$pkgrel.tar.xz::https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-x86_64.tar.xz)
source_aarch64=(spotube-linux-nightly-$pkgver-$pkgrel.tar.xz::https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-aarch64.tar.xz)
noextract=()
sha256sums_x86_64=(4c2e5c8f4b7a697f91d96635a2ed1a2217a38db08dfbae4689a4da501c28d746)
sha256sums_aarch64=(1c8cc238ffcded54c38b3c1a07554e3988e0fff17ce3384a11f39b0a5facad2d)
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/usr/share/icons/spotube"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/appdata"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    mv ./spotube.desktop "${pkgdir}/usr/share/applications"
    mv ./spotube-logo.png "${pkgdir}/usr/share/icons/spotube/"
    mv ./com.github.KRTirtho.Spotube.appdata.xml "${pkgdir}/usr/share/appdata/spotube.appdata.xml"
    cp -ra ./data ./lib ./spotube "${pkgdir}/usr/share/${pkgname}"
    sed -i 's|com.github.KRTirtho.Spotube|spotube|' "${pkgdir}/usr/share/appdata/spotube.appdata.xml"
    ln -s "/usr/share/${pkgname}/spotube" "${pkgdir}/usr/bin/spotube"
}
