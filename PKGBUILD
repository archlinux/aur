# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <eeppeliteloop@gmail.com>

pkgname=python2-lttngust
_pkgbase="lttng-ust"
pkgver=2.10.3
pkgrel=2
pkgdesc='LTTng-UST Python agent'
arch=('any')
url='http://lttng.org/'
license=('LGPL2.1' 'GPL2' 'MIT')
makedepends=('python2')
depends=('lttng-ust>=2.7.0')
source=("https://lttng.org/files/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('6f646de3a12dbad096014f3069c3e702fb54b824b78770e777f6f877c76ffc48fae863b10c432bff1bba29caafdb5b76cb2b9cb88eb7340d5121300d2c0ff65d'
            'SKIP')
validpgpkeys=('2A0B4ED915F2D3FA45F5B16217280A9781186ACF')

build()
{
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix='/usr' \
        --enable-man-pages
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make check
}

package() {
    pkgdesc='LTTng-UST Python2 Bindings'
    depends=('lttng-ust' 'python2')

    cd "${srcdir}/${_pkgbase}-${pkgver}/python-lttngust"
    make DESTDIR="${pkgdir}" PYTHON="/usr/bin/python2" install

    # add license to the respective packages
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

