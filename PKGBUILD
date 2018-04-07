# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl-git
pkgver=2.31.r15.g92f8239
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL3")
depends=('ffmpeg' 'python-mini-amf' 'python-pycryptodomex'
         'python-future' 'python-lxml' 'python-pysocks' 'python-requests' 'wget')
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
            'youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-git}=$pkgver)
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://github.com/aajanki/yle-dl.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

