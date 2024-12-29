# Contributor: Midov <midov@midov.pl>

pkgname=pantalaimon
pkgver=0.10.5
pkgrel=6
pkgdesc='Pantalaimon is an end-to-end encryption aware Matrix reverse proxy daemon.'
arch=('any')
url='https://github.com/matrix-org/pantalaimon'
license=('Apache')
depends=('python' 'python-matrix-nio' 'python-prompt_toolkit' 'python-janus' 'python-peewee' 'python-logbook' 'python-aiohttp' 'python-cachetools' 'python-notify2' 'python-pydbus' 'python-jsonschema' 'python-click' 'python-appdirs' 'python-keyring>=21.2.1' 'python-attrs' 'python-dbus' 'glib2' 'python-multidict' 'python-gobject')
makedepends=('python-setuptools')
source=("https://github.com/matrix-org/pantalaimon/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('970e79db0692a23c0e2d7f6ee9e3cd67b482b5a3fcb739cc899806494748db77'
            'cf693e0324a7f2965bc9e64ab2c3d75137e7993503ddb3ae3dddc84af6c0b0e9')

build() {
        cd "${pkgname}-${pkgver}"
}

package() {
        cd "${pkgname}-${pkgver}"
        python setup.py install --prefix=/usr --root="$pkgdir"
	sed -i -e 's/matrix-nio[e2e]<0.21,>=0.20/matrix-nio[e2e]>=0.20/g' pantalaimon.egg-info/requires.txt
        install -Dm644 "${srcdir}"/pantalaimon.service "${pkgdir}"/usr/lib/systemd/user/pantalaimon.service
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/man/*.md -t "${pkgdir}"/usr/share/doc/"${pkgname}"/
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/man/*.1 -t "${pkgdir}"/usr/share/man/man1/
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/man/*.5 -t "${pkgdir}"/usr/share/man/man5/
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/man/*.8 -t "${pkgdir}"/usr/share/man/man8/
	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
