# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-bin
_binaryname=sonicrust
pkgver=0.1.2
pkgrel=1
pkgdesc="A rust base TUI subsonic client"
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
# depends=('alsa-lib' 'libudev-dev' 'dbus' 'chafa')
depends=('chafa' 'alsa-lib' 'glibc' 'gcc-libs')
provides=('_binaryname')
options=(strip)
conflicts=('_binaryname')
source_x86_64=("${_binaryname}_v${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_binaryname}_v${pkgver}_linux_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_binaryname}_v${pkgver}_linux_aarch64.tar.gz")
sha256sums_aarch64=('25c2dc6e9f5b0e2cf2f0e040e92b10d25d25adf142caa97218fec0b5c37ddaba')
sha256sums_x86_64=('6e43747467a5b736cb16f728695c0d6517aa7f38735048311c9290a0984e4891')

package() {
if [ "$CARCH" = "x86_64" ]; then
        _arch="x86_64"
    elif [ "$CARCH" = "aarch64" ]; then
        _arch="aarch64"
    fi
mkdir -p "$pkgdir"/usr/bin
mkdir -p "$pkgdir"/usr/share/applications
  # cd "${srcdir}/${_binaryname}_v${pkgver}_${_arch}"

install -Dm755 "$_binaryname" "${pkgdir}/usr/bin/${_binaryname}"
  # Create desktop file
# touch "$pkgdir"/usr/share/applications/"$_binaryname".desktop
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
