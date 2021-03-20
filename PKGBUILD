# Maintainer  : Yamada Hayao <hayao@fascode.net>
# Contributer : Katherine J. Cumberbatch <stykers@stykers.moe>

_pkgname="vlc-plugin-fluidsynth"
pkgname="${_pkgname}-bin"
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64')
url="http://www.videolan.org/vlc/"

depends=('vlc>3.0.0' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont")

deb_pkgver="3.0.12"
deb_pkgrel="3"
pkgver="${deb_pkgver}.${deb_pkgrel}"
pkgrel="1"

conflicts=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
replaces=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")

install="notes.install"
license=('LGPL2.1')

source_x86_64=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_amd64.deb")
md5sums_x86_64=("13e55ed913f6f42a792ea2c7b4b731b9")
sha512sums_x86_64=("db9570c4e32fb757f61f24a1474a9dc894adab94777abda3e3e1bdf7b3178fc78d64a00b118c649595948ac93efdf241efa67dbd7b52dddb36e5b99206b2c458")

prepare() {
    tar -xvf "${srcdir}/data.tar.xz"
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
    local plugin=$(find "${srcdir}/usr/lib" -name "libfluidsynth_plugin.so")
    echo "Foudn ${plugin}"
    install -Dm0755 "${plugin}" "${pkgdir}/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
}
