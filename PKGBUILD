# Maintainer: A Christensen <fauxmight@ivories.org>
# Contributor: Midov <midov@midov.pl>

_pkgname=pantalaimon
pkgname="${_pkgname}"-git
pkgver=0.10.5.32.g257ef6a
pkgrel=1
pkgdesc="Pantalaimon is an end-to-end encryption aware Matrix reverse proxy daemon."
arch=('x86_64')
url="https://github.com/matrix-org/pantalaimon"
license=('Apache')
depends=('python' 'libolm' 'python-matrix-nio' 'python-prompt_toolkit' 'python-janus' 'python-peewee' 'python-logbook' 'python-aiohttp' 'python-cachetools' 'python-pycryptodome' 'python-unpaddedbase64' 'python-h2' 'python-h11' 'python-notify2' 'python-pydbus' 'python-olm' 'python-jsonschema' 'python-atomicwrites' 'python-click' 'python-appdirs' 'python-keyring>=21.2.1')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/matrix-org/pantalaimon"
        "${_pkgname}.service")
sha256sums=('SKIP'
            'cf693e0324a7f2965bc9e64ab2c3d75137e7993503ddb3ae3dddc84af6c0b0e9')

pkgver() {
        cd "${_pkgname}"
        git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

package() {
        cd "${_pkgname}"
        python setup.py install --prefix=/usr --root="$pkgdir"
        install -Dm644 "${srcdir}"/pantalaimon.service "${pkgdir}"/usr/lib/systemd/user/pantalaimon.service
        install -Dm644 "${srcdir}"/"${_pkgname}"/docs/man/*.md -t "${pkgdir}"/usr/share/doc/"${_pkgname}"/
        install -Dm644 "${srcdir}"/"${_pkgname}"/docs/man/*.1 -t "${pkgdir}"/usr/share/man/man1/
        install -Dm644 "${srcdir}"/"${_pkgname}"/docs/man/*.5 -t "${pkgdir}"/usr/share/man/man5/
        install -Dm644 "${srcdir}"/"${_pkgname}"/docs/man/*.8 -t "${pkgdir}"/usr/share/man/man8/
        install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${_pkgname}"/
}

# vim:set ts=2 sw=2 et:
