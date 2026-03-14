# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: axionl <axionl@aosc.io>
# Contributor: Sherlock Holo <sherlockya(at)gmail.com>

_pkgauthor=filebrowser
_pkgname=filebrowser
pkgname=${_pkgname}-bin
pkgver=2.62.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app."
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"

source=('filebrowser.service'
        'filebrowser@.service'
        'filebrowser.sysusers'
        'filebrowser.tmpfiles'
        'filebrowser-bin.install'
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/linux-${_barch[0]}-filebrowser.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/linux-${_barch[1]}-filebrowser.tar.gz")
sha256sums=('1d85acca4ca9bcdb6767ff60891d6e0a4e9c324fc50bed1231e8c891eb9c4420'
            '29031d87f8294889ea33658570422406ca8c13367ae20cbcc1f98132df83ea14'
            '6246fbeac57750e146216892ed6eb1d43a995f987bb89ef12bcbfb3963f5aa2d'
            '726ba81467fe9e76848ebb88960cc7b34f5f423593183a62959a693eca47021c'
            '3495234f011491a1d448af24bfe8af8018bb4c5b1a4c4ef53651fb068d9801c4'
            '4a1946819f24b20b3144360151a4dc1ed1b8e407bfb11045a74884abd6816100'
            'ee55dc02d2ad5c5532649b0c8a2c3612ae6706a80d0e6001ea61895624049b36')
sha256sums_x86_64=('fda39b79f5b5ce805820755eb0f28af92991f8fe8d9e10ebb73436f013d33c32')
sha256sums_aarch64=('f923d7c84ca8f5e4a51b0c0173680c9728ab0814ed0394b5cad4c9a16a982f3f')


package() {
    cd "${srcdir}/" || exit

    install -Dm755 "${srcdir}/filebrowser" -t "${pkgdir}/usr/bin/"

    install -Dm644 "filebrowser.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "filebrowser@.service" -t "${pkgdir}/usr/lib/systemd/system/"

    install -Dm644 "${srcdir}/filebrowser.sysusers" "${pkgdir}/usr/lib/sysusers.d/filebrowser.conf"
    install -Dm644 "${srcdir}/filebrowser.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/filebrowser.conf"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
