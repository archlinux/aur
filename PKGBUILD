# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=peteonrails
_pkgname=voxtype
pkgname=${_pkgname}-bin
pkgdesc="Push-to-talk voice-to-text for Linux (optimized for Wayland, works on X11)"

pkgver=0.4.1
pkgrel=1
_pkgvername=v${pkgver}-${pkgrel}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('tar')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'curl')

backup=('etc/voxtype/config.toml')
install=voxtype.install

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
sha256sums_x86_64=('968a9903608fddf855bfedd65037c117b2e2641a6cb71a56d7fa2913c3aaaa7e')


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
