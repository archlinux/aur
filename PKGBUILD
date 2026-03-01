# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-bin
_binaryname=sonicrust
pkgver=0.1.6
pkgrel=1
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
sha256sums_x86_64=('a41bc2347925a058c19296f8e78cd4c2868f0cd52f7059f3a5ea3e3a9e890f09')
sha256sums_aarch64=('e296e9ae4244d8981880783d25b44f98b4938a97758f009cbe5712e578a2f078')

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
