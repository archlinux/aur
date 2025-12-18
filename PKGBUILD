# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=peteonrails
_pkgname=voxtype
pkgname=${_pkgname}-bin
pkgdesc="Push-to-talk voice-to-text for Linux (optimized for Wayland, works on X11)"

pkgver=0.4.0
pkgrel=2
_pkgvername=v${pkgver}-${pkgrel}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('tar')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'vulkan-icd-loader')

backup=('etc/voxtype/config.toml')
install=voxtype.install

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
sha256sums_x86_64=('29c7f2e4573384572d8424705bbf3159fc04cc7cddf184237749cd3c49b237ac')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    chmod 644 "${pkgdir}/usr/lib/systemd/user/voxtype.service"
    chmod 644 "${pkgdir}/usr/share/bash-completion/completions/voxtype"
    chmod 644 "${pkgdir}/usr/share/fish/vendor_completions.d/voxtype.fish"
    chmod 644 "${pkgdir}/usr/share/zsh/site-functions/_voxtype"
    chmod 644 "${pkgdir}/usr/share/doc/voxtype/LICENSE"
}
