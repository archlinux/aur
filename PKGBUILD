# Contributor: Eric Fung <loseurmarbles at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.19.0
pkgrel=1
pkgdesc='Secure, decentralized, and fault-tolerant storage system.'
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL' 'custom')
arch=('any')
depends=('magic-wormhole'
         'python-cbor2'
         'python-collections-extended'
         'python-eliot'
         'python-filelock'
         'python-foolscap'
         'python-future'
         'python-klein'
         'python-netifaces'
         'python-psutil'
         'python-pycddl'
         'python-pyutil'
         'python-treq'
         'python-yaml'
         'python-zfec')
# python-boltons is for python-eliot until the maintainer adds it.

source=(https://tahoe-lafs.org/downloads/tahoe-lafs-${pkgver}.tar.gz{,.asc})

sha256sums=('bb48d440965bc3af0b25cfbe407c6100beda318a99280d65eeb24e45f08259ce'
            'SKIP')

validpgpkeys=('9D5A2BD5688ECB889DEBCD3FC2602803128069A7')
# https://meejah.ca/about/gnupg

build() {
    cd "${srcdir}/tahoe-lafs-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/tahoe-lafs-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
