# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-bin
_binaryname=sonicrust
pkgver=0.1.4
pkgrel=1
pkgdesc="A Terminal based music player for Subsonic-compatible servers, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
# depends=('alsa-lib' 'libudev-dev' 'dbus' 'chafa')
depends=('chafa' 'alsa-lib' 'glibc' 'openssl')
provides=('_binaryname')
options=(strip)
conflicts=('_binaryname')
source_x86_64=("${_binaryname}_v${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_binaryname}_v${pkgver}_linux_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_aarch64.tar.gz")
sha256sums_x86_64=('fe2408bb89d72a4c62fb7c2feec990b69a4006f75505f4291e5ce187c0518b69')
sha256sums_aarch64=('0d96dea610666b234b48942d6a534c2dd73960ccc62cd56c0a07339dd7cb6232')

package() {
mkdir -p "$pkgdir"/usr/bin
mkdir -p "$pkgdir"/usr/share/applications

install -Dm755 "$_binaryname" "${pkgdir}/usr/bin/${_binaryname}"
  # Create desktop file
cat > "$pkgdir"/usr/share/applications/"$_binaryname".desktop << EOF
[Desktop Entry]
Name=Sonicrust
Comment=${pkgdesc}
Exec=/usr/bin/"$_binaryname" %u
Terminal=true
Type=Application
Icon=${_binaryname}
Categories=AudioVideo;Audio;Player;ConsoleOnly
Keywords=music;player
EOF
}
