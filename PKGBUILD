# Maintainer  : Yamada Hayao <hayao@fascode.net>
# Contributer : Katherine J. Cumberbatch <stykers@stykers.moe>

_pkgname="vlc-plugin-fluidsynth"
pkgname="${_pkgname}-bin"
pkgdesc="FluidSynth plugin for VLC"
arch=('x86_64' "i386" "aarch64" "i686")
url="http://www.videolan.org/vlc/"

depends=('vlc>3.0.0' 'fluidsynth')
optdepends=("soundfont-fluid: FluidR3_GM soundfont")

deb_pkgver="3.0.16"
deb_pkgrel="1+b2"
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

md5sums_x86_64=('8ecf7212615f3d153df76e93e650f860')
md5sums_i386=('6c925c71abf946ba8a4ad2ba1a9bd9ba')
md5sums_aarch64=('d66c25744ec4056a5f04c4860048b19c')
md5sums_i686=('6c925c71abf946ba8a4ad2ba1a9bd9ba')
sha512sums_x86_64=('87910a60e20d5731d96ee57620763e7109df958117d23ca90dca481c09048e0a5874b57af771633059cc7d8593b504968ee5c4b2bc0510f2ec5b772c00b567e2')
sha512sums_i386=('3cc9fa4b34cc365c1fb298712250c501fd43852746151c93d06dfeea756386d3dc16062adae4edc303c00a968b2fbdd842330f302f4e5f7426cd69b5bda5b232')
sha512sums_aarch64=('b6b2fc93202adbb324fdb32dec630688bbe62e867b066c0045f1a3b2c6ebc3e30968406f5e0a74d1ac128b256987f17242d72a8f67ef7ba6f5fd29fe43f6675b')
sha512sums_i686=('3cc9fa4b34cc365c1fb298712250c501fd43852746151c93d06dfeea756386d3dc16062adae4edc303c00a968b2fbdd842330f302f4e5f7426cd69b5bda5b232')

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
