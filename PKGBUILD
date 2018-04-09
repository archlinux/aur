# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="periscopio-mate"
pkgver="1.18.1"
pkgrel="1"
pkgdesc="An Python module for searching subtitles on the web. Includes a caja extension."
url="https://github.com/darkshram/periscopio-mate"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('caja' 'python2-beautifulsoup3')
provides=("${pkgname}")
source=("https://github.com/darkshram/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e9e092b4d9318e9379be082632f7129c74dd8dd2b48be2b84f4320c582e20adc')

build() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py build
}
package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d -m755 "${pkgdir}/usr/share/caja-python/extensions"
    install -D -m755 ./bin/periscopio-caja/periscopio-caja.py* "${pkgdir}/usr/share/caja-python/extensions/"
    for n in ./po/*.mo; do
        install -p -D -m644 $n ${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/${pkgname}.mo
    done
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
