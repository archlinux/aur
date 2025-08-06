# Maintainer : Yamashita Ren <lemaitre dot lotus at gmail.com>

pkgname=sushi-shifter-git
_gitname=sushi
pkgver=0.6.2.r0.g747c979
pkgrel=1
pkgdesc="Automatic shifter for SRT and ASS subtitle based on audio streams."
arch=('i686' 'x86_64')
url="https://github.com/FichteFoll/Sushi"
license=('custom')
depends=('python' 'python-numpy' 'opencv2')
optdepends=('ffmpeg: if demuxing is used' 
            'mkvtoolnix-cli: faster timecodes extraction when demuxing')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-opencv' 'python-standard-chunk')
source=(${_gitname}::git+${url})
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl 
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

