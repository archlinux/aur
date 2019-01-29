# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: ZaZam <zazaamm ät gmail dt com>

pkgname=yle-dl
pkgver=20181221
pkgrel=3
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python-attrs>=18.1.0'
       'python-attrs<18.3.0'
       'python-configargparse>=0.13.0'
       'python-future'
       'python-lxml'
       'python-mini-amf'
       'python-pycryptodomex'
       'python-requests'
       'wget'
)
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
	    'youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/yle-dl/yle-dl-${pkgver}.tar.gz"
        'configargparse.patch'
)
sha256sums=('8970960816151d0e296c0ab15b9371c0feea444567c59a7b2917bdf5f0de06fd'
            'cfdf7268d945e1f03d5911acdf54900672083f08574cc1e887e134ae097e45d8')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/configargparse.patch"
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
