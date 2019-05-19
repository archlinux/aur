# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.8.4
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
sha512sums=('2bd654f225a54c8b3f663798b79104751a39db90bfaa58db6f1e1c6e118d4e0fbdebc94c5429a15f6cf8c0b4f2f4f47b36bc95c058a488af474b5f52189e6fe9'
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
