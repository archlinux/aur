# Maintainer: Niklas <dev@n1klas.net>

pkgname=appdaemon
pkgver=3.0.1
pkgrel=1
pkgdesc="Python execution environment for Home Assistant automation apps"
arch=('any')
url="http://appdaemon.readthedocs.io/"
license=('Apache')
depends=('python-daemonize' 'python-astral' 'python-requests'
         'python-sseclient' 'python-websocket-client'
         'python-aiohttp-jinja' 'python-yaml' 'python-voluptuous'
         'python-feedparser' 'python-iso8601' 'python-bcrypt')
makedepends=('python-setuptools')
backup=('etc/appdaemon/appdaemon.yaml')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'appdaemon.yaml'
        'appdaemon.service'
        'appdaemon.sysusers')
sha512sums=('54eed1f88afdfe8cc595c7a40efe3208eb1b6638f53a56f4bfa3cb371e837a17c2a6e701305b420880ae1202f9297d658f30fa232b425ca5d26912a3a898392b'
            '538a9da9a2c296694696fe69029b29ddd7bc21bcc071cbb54052eb82811e63849d8103951f23fcc2b623d628088f2bd0fbe469577fe9943598315c804654c9b8'
            'c1de8558962a1e92b44db6a6a95731094c4e1890c3c1a1c1436eda72d68997224f70c6dc9f8d1b86e1b131c0dc66a0f4107fdca0f75777220e14d57aeea0a222'
            'd46356da6a00398c77edf1143dbb2f6061d896986868226525afa0bd8c873f3cd699fa6c3fff4b120b04b7fb2761c55873bacccfff5eb3defab0d1b7f79cb878')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mkdir -p "${pkgdir}/etc/appdaemon/apps"
    install -Dm644 "${srcdir}/appdaemon.yaml" "${pkgdir}/etc/appdaemon/appdaemon.yaml"
    install -Dm644 "${srcdir}/appdaemon.service" "${pkgdir}/usr/lib/systemd/system/appdaemon.service"
    install -Dm644 "${srcdir}/appdaemon.sysusers" "${pkgdir}/usr/lib/sysusers.d/appdaemon.conf"
}
