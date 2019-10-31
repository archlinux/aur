# Maintainer: katt <magunasu.b97 [at] gmail [dot] com>

_pkgname=gallery-dl
pkgname=$_pkgname-git
pkgver=1.10.6.r37.g8361d87
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools' 'git')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/mikf/gallery-dl.git)
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd $_pkgname
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

package() {
  cd $_pkgname
  make
  python setup.py install -O1 --root="$pkgdir"
  mv "${pkgdir}/usr/share/bash-completion/completions/gallery-dl.bash_completion" \
     "${pkgdir}/usr/share/bash-completion/completions/gallery-dl"
}
