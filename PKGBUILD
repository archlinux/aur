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
deb_pkgrel="1+b4"
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

md5sums_x86_64=('f84934a602d8d22f505699d8b0aee506')
md5sums_i386=('cd86c5875abdbc5149113faa8b175d22')
md5sums_aarch64=('7535584d7f9ee00b282ed5b6330609d2')
md5sums_i686=('cd86c5875abdbc5149113faa8b175d22')
sha512sums_x86_64=('8d628b749c3c59a0d6e84d63b12e9e12d9b5d0dacbd8ed1c911dbc8b2a23ad1a4af77d28ad81cf8635a020bc0e6cb198dec4171986e1cc4c181e7f3506af4979')
sha512sums_i386=('70e9fd100d8134b55ad67b38ed1c6ac290a7cca4032772844927f1fbebe1e292cfb36afc899493f82052e039ecc3fb3e1ba06c654442f02bb7cebafc444f2bd2')
sha512sums_aarch64=('d11134436a3ea4093255a946cbc43095d2c7fc826316cdf6d67a81866da9e885239bbc46215fd848ec85d92efebdfe8dd47cc206b5f45c508fa3e2ec98fd3016')
sha512sums_i686=('70e9fd100d8134b55ad67b38ed1c6ac290a7cca4032772844927f1fbebe1e292cfb36afc899493f82052e039ecc3fb3e1ba06c654442f02bb7cebafc444f2bd2')

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
