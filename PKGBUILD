# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-bin
_binaryname=sonicrust
pkgver=0.1.5
pkgrel=2
pkgdesc="A Terminal based music player for Subsonic-compatible servers, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
# depends=('alsa-lib' 'libudev-dev' 'dbus' 'chafa')
depends=('chafa' 'alsa-lib' 'glibc' 'openssl')
provides=('sonicrust')
options=(strip)
conflicts=('sonicrust' 'sonicrust-git')
source_x86_64=("${_binaryname}_v${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_binaryname}_v${pkgver}_linux_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_aarch64.tar.gz")
sha256sums_x86_64=('106764b79700910e553cdd550a0aa9a4f07c33f44a4d18721213a4eafd9b6b28')
sha256sums_aarch64=('9011617e055c94d8341ac9bd4ce28d2c792f446352af2162e5db353322b66581')

package() {
mkdir -p "$pkgdir"/usr/bin
mkdir -p "$pkgdir"/usr/share/applications

install -Dm755 "$_binaryname" "${pkgdir}/usr/bin/${_binaryname}"
  # Create desktop file
cat > "$pkgdir"/usr/share/applications/"$_binaryname".desktop << EOF
[Desktop Entry]
Name=Sonicrust
Comment=${pkgdesc}
Exec=$_binaryname %u
Terminal=true
Type=Application
Icon=${_binaryname}
Categories=AudioVideo;Audio;Player;ConsoleOnly
Keywords=music;player
EOF
}
