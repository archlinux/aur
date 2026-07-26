# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: axionl <axionl@aosc.io>
# Contributor: Sherlock Holo <sherlockya(at)gmail.com>

_pkgauthor=filebrowser
_pkgname=filebrowser
pkgname=${_pkgname}-bin
pkgver=2.63.21
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Standalone web file manager"

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://filebrowser.org/"
_gurl="https://github.com/${_pkgauthor}/${_pkgname}"
_gurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"

source=("${_pkgname}.service"
        "${_pkgname}@.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${pkgname}.install"
        "LICENSE-${pkgver}::${_gurlraw}/LICENSE"
        "README-${pkgver}.md::${_gurlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${_gurl}/releases/download/${_pkgvername}/linux-${_barch[0]}-${_pkgname}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${_gurl}/releases/download/${_pkgvername}/linux-${_barch[1]}-${_pkgname}.tar.gz")
sha256sums=('1d85acca4ca9bcdb6767ff60891d6e0a4e9c324fc50bed1231e8c891eb9c4420'
            '29031d87f8294889ea33658570422406ca8c13367ae20cbcc1f98132df83ea14'
            '6246fbeac57750e146216892ed6eb1d43a995f987bb89ef12bcbfb3963f5aa2d'
            '726ba81467fe9e76848ebb88960cc7b34f5f423593183a62959a693eca47021c'
            '3495234f011491a1d448af24bfe8af8018bb4c5b1a4c4ef53651fb068d9801c4'
            '4a1946819f24b20b3144360151a4dc1ed1b8e407bfb11045a74884abd6816100'
            'f550b4356e015f1d479fa3ffcc7a7e64e72cde5c503a8be338d6ddc9baa5f3db')
sha256sums_x86_64=('8e3954467067aa6f4988dc6dd7357129fe38d2e445fa2936bebf99620bc07ec7')
sha256sums_aarch64=('80d55942148701551b97533e0a11153f51191a668deea2735c496a5d1bab473a')


package() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

    install -Dm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system/"

    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
