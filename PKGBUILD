# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Silvio <s.i.l.v.io..f.r.i.c.k.e@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>

_pkgname=shellcheck
pkgname="${_pkgname}-bin-doc"
pkgdesc='Shell script analysis tool (static binary release, with man pages)'
pkgver=0.10.0
pkgrel=1
url='https://shellcheck.net'
arch=('x86_64' 'armv6h' 'aarch64')
license=(GPL-3.0-or-later)
makedepends=('pandoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# full source, for the man pages
source=("https://github.com/koalaman/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('b3d75b1e29e6e0f6010cc370f20a886cec22cb40bc439985e181b50314e7edfddc9c5662fd2088a84aee2f8399e9af33d02289fb0ddcf43b70ab6474d7ea5328')
# binary releases
source_x86_64=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.x86_64.tar.xz")
b2sums_x86_64=('9cf6eeccb13770808a6efdedd27b85c925f0ab899a82ac8fdf8c16e9133d3f91b5b80900a3c1e11ee7b0b035aab1c08d439b682a479c5b47a218e55bc08562c5')
source_armv6h=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.armv6hf.tar.xz")
b2sums_armv6h=('89788bf2de2c7c1fc1b78a64c1e28c08fea5fd29928c198cb80989191f63bcda6c9e0ebda5a5ffb471f7331292740486bc2f1cc894d30e8b704e6d2fb4a925f1')
source_aarch64=("https://github.com/koalaman/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux.aarch64.tar.xz")
b2sums_aarch64=('6402fe9230c44dbf4620d019bd505246f06d7b96233d57b154f1b6a453f116e8c633768f8bce8f2031672a8df7dcac4de9ea5ebf6274444e450718b1cd300b4b')

# folders generated from the tar files
_sourcedir="${_pkgname}-${pkgver}"
_binarydir="${_pkgname}-v${pkgver}"

build() {
    cd "${_sourcedir}"
    ./manpage
}

package() {
    install -D -m755 "${_binarydir}/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -D -m644 "${_sourcedir}/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
}
