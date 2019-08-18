# Maintainer: katt <magunasu.b97 [at] gmail [dot] com>

_pkgname=gallery-dl
pkgname=gallery-dl-git
pkgver=r1885.b1728f5
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
source=(git+https://github.com/mikf/$_pkgname.git)
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
