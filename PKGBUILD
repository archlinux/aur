# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20190614
pkgrel=3
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/yle-dl/yle-dl-${pkgver}.tar.gz"
	"python-attrs.patch")
sha256sums=('c8c88cd6d48426623c008ccbe6efec1d06e61a9316dda82313070589469303bb'
            '4608d89261c6fd41cf3a5c96d9bee739874e4665366280bea4282b7c19894d4c')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/python-attrs.patch"
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
