# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20191022
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python-attrs>=18.1.0'
       'python-attrs<19.4.0'
       'python-configargparse>=0.13.0'
       'python-future'
       'python-lxml'
       'python-mini-amf'
       'python-pycryptodomex'
       'python-requests'
)
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading some  Elävä Arkisto streams'
	    'youtube-dl: an alternative downloader backend to AdobeHDS.php'
            'wget: for some rare streams')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/yle-dl/yle-dl-${pkgver}.tar.gz")
sha256sums=('6e4ef38c5162ddd3da800c7c97c5fcb3dc4d12f9809a9d9d949c114877714801')

# Patching setup.py to allow attrs 19.3
prepare() {
  cd $pkgname-$pkgver
  sed -i 's/attrs >= 18.1.0, < 19.3.0'/'attrs >= 18.1.0, < 19.4.0/g' setup.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
