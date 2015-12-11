# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=televize-git
pkgdesc="CLI aplication to watch Czech television streams"
pkgver=r14.9b18d85
pkgrel=1
arch=('any')
url="https://github.com/ziima/televize"
license=('apache')
depends=('python2' 'mplayer' 'curl' 'bash')
source=("${pkgname}"::'git+https://github.com/ziima/televize.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  sed -i 's%python %python2 /usr/bin/%' televize
  sed -i '1s/python/&2/' televize.py
  install -D -m755 ./televize $pkgdir/usr/bin/ct_televize
  install -D -m755 ./televize.py $pkgdir/usr/bin/televize.py
}
