# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.8.1
pkgrel=1
pkgdesc="Command-line program to download image-galleries and -collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('6b7943e0555b9b66f83d2da8efde4ec58716534ac51c50ba2c5881b7481edf4cec184c46d26e29944a9d596c0de6f0ad6f5fff129c41c7fa6557989e02e04c32'
	    'SKIP')

prepare(){
  cd gallery_dl-$pkgver
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

package() {
  cd gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
  mv "${pkgdir}/usr/share/bash-completion/completions/gallery-dl.bash_completion" \
     "${pkgdir}/usr/share/bash-completion/completions/gallery-dl"
}
