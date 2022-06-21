# Maintainer  : silverhikari <kerrickethan@gmail.com>
# Contributer : Yamada Hayao <hayao@fascode.net>
# Contributer : Katherine J. Cumberbatch <stykers@stykers.moe>

_pkgname="vlc-plugin-fluidsynth"
pkgname="${_pkgname}-bin"
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64' "i386" "aarch64" "i686")
url="http://www.videolan.org/vlc/"

depends=('vlc>3.0.0' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont")

deb_pkgver="3.0.17.4"
deb_pkgrel="3"
pkgver="${deb_pkgver}.${deb_pkgrel}"
pkgrel="1"

conflicts=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
replaces=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")

install="notes.install"
license=('LGPL2.1')

source_x86_64=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_amd64.deb")
source_i386=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_i386.deb")
source_i686=("${source_i386[@]}")
source_aarch64=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_arm64.deb")

sha512sums_x86_64=('SKIP')
sha512sums_i386=('SKIP')
sha512sums_aarch64=('SKIP')
sha512sums_i686=('SKIP')

prepare() {
    tar -xvf "${srcdir}/data.tar.xz"
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
    local plugin=$(find "${srcdir}/usr/lib" -name "libfluidsynth_plugin.so")
    echo "Found ${plugin}"
    install -Dm0755 "${plugin}" "${pkgdir}/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
