# Contributor: Eric Fung <loseurmarbles at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor (Arch): Peter Simons <simons@cryp.to>
# Contributor (Arch): Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=tahoe-lafs
pkgver=1.17.1
pkgrel=1
pkgdesc='Secure, decentralized, and fault-tolerant storage system.'
url='https://tahoe-lafs.org/trac/tahoe-lafs'
license=('GPL' 'custom')
arch=('any')
depends=('magic-wormhole'
         'python-argparse'
         'python-bcrypt'
         'python-boltons'
         'python-cbor2'
         'python-collections-extended'
         'python-eliot'
         'python-foolscap'
         'python-future'
         'python-klein'
         'python-netifaces'
         'python-pyrsistent'
         'python-treq'
         'python-yaml'
         'python-zfec')
# python-boltons is for python-eliot until the maintainer adds it.

source=(https://tahoe-lafs.org/downloads/tahoe-lafs-${pkgver}.tar.gz{,.asc})

sha256sums=('2dc7fc103fe0e4f9fc69953934089f55e4428bd5d94670e844e64c210d7c1672'
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
