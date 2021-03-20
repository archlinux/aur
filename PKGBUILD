# Maintainer  : Yamada Hayao <hayao@fascode.net>
# Contributer : Katherine J. Cumberbatch <stykers@stykers.moe>

_pkgname="vlc-plugin-fluidsynth"
pkgname="${_pkgname}-bin"
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64' "i386" "aarch64" "i686")
url="http://www.videolan.org/vlc/"

depends=('vlc>3.0.0' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont")

deb_pkgver="3.0.12"
deb_pkgrel="3"
pkgver="${deb_pkgver}.${deb_pkgrel}"
pkgrel="2"

conflicts=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
replaces=("${pkgname}-git" "${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")

install="notes.install"
license=('LGPL2.1')

source_x86_64=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_amd64.deb")
md5sums_x86_64=("13e55ed913f6f42a792ea2c7b4b731b9")
sha512sums_x86_64=("db9570c4e32fb757f61f24a1474a9dc894adab94777abda3e3e1bdf7b3178fc78d64a00b118c649595948ac93efdf241efa67dbd7b52dddb36e5b99206b2c458")

source_i386=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_i386.deb")
md5sums_i386=("73151fd6628603af32ccfc7b0a55b4d7")
sha512sums_i386=("1e9eb1f1f153a5b4e71f8152fac432b20d50861ce0be9b54571615dfe6b779f2e85d552f1327d329da2644b9b2e6ef7826e9f127599ecc87a8d54dddfc11b65b")

source_i686=("${source_i386[@]}")
md5sums_i686=("${md5sums_i386[@]}")
sha512sums_i686=("${sha512sums_i386[@]}")

source_aarch64=("https://ftp.debian.org/debian/pool/main/v/vlc/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_arm64.deb")
md5sums_aarch64=("ff5ad17b03e9154c0390db299b7dd0e9")
sha512sums_aarch64=("2ffc8747022d73244a96c373d4734b5aa6dd0fa6c09bf6ab75b163e50cc19c79d80b33356ca2059b2f28ad46649e29c9b5f69688e5acc65aea9ae0d04a7fa210")


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
