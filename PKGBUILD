# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-bin
_binaryname=sonicrust
pkgver=0.1.3
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
sha256sums_x86_64=('088fab21e11ef34a3059ed2fdb9ba650f4dbc00709a3d439a88692b778773aeb')
sha256sums_aarch64=('c0de75e0064d2cc146db9338e002a88e6925340f9233dd0496b16d748792af46')

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
