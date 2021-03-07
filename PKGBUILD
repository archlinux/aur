# Maintainer  : Yamada Hayao <hayao@fascode.net>
# Contributer : Katherine J. Cumberbatch <stykers@stykers.moe>

pkgname="vlc-plugin-fluidsynth-bin"
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64')
depends=('vlc>3.0.0' 'fluidsynth')
url="http://www.videolan.org/vlc/"
deb_pkgver="3.0.12"
deb_pkgrel="2"
pkgver="${deb_pkgver}.${deb_pkgrel}"
pkgrel="1"
optdepends=("soundfont-fluid: FluidR3_GM soundfont")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")
install="notes.install"
license=('LGPL2.1')
source_x86_64=("http://ftp.br.debian.org/debian/pool/main/v/vlc/vlc-plugin-fluidsynth_${deb_pkgver}-${deb_pkgrel}_amd64.deb")
md5sums_x86_64=("SKIP")

prepare() {
    tar -xvf data.tar.xz
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
    local plugin=$(find "${srcdir}/usr/lib" -name "libfluidsynth_plugin.so")
    echo "Foudn ${plugin}"
    install -Dm0755 "${plugin}" "${pkgdir}/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
