# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.10.5
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('54a7163fedfd9635774c41e327f480121b53fb06b4f382d6f92fddaa72ad3a653a661dc38650f130218bca501dabf772237e49552ad9f7b19ac1eb191d441d28'
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
