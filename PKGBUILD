# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=general-preprocessor
pkgver=1.4
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://github.com/maandree/gpp"
arch=(any)
license=(GPL3)
depends=(python bash)
makedepends=(make coreutils python texinfo)
install=general-preprocessor.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(8d3bc8585b6330a3302c9e02ec1abd691938d70529683e12e6c1aca7eabd04c9)

_prefix=/usr
_command=gpp ## change this if you have a package conflicting package


build() {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="${_prefix}" PKGNAME="${pkgname}" COMMAND="${_command}" DESTDIR="${pkgdir}" PY=python3
}

package() {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="${_prefix}" PKGNAME="${pkgname}" COMMAND="${_command}" DESTDIR="${pkgdir}" PY=python3 install
        _dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
        ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

