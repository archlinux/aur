# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.13'
_upstreamver_regex='^[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='rr-/urwid_readline'


pkgname='python-urwid_readline'
_pkgname='urwid_readline'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Text input widget for urwid that supports readline shortcuts"
url="https://github.com/${_repo}"
depends=('python' 'python-urwid')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('51516c635a376c93a67bc6d28a4639614e5af23dc44a540a266ac2a2053f470c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
