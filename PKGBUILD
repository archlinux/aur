# Maintainer: Erez Raviv (erezraviv@gmail.com)
# Latest Revision 2726
pkgname=chirp-daily
pkgver=$(curl -q http://trac.chirp.danplanet.com/chirp_daily/LATEST/ | egrep -o "20[0-9]{6}" | uniq -d)
pkgrel=2726
pkgdesc="Daily build for GUI tool for programming ham radios; This package gets updated once an announcement of a new version is made."
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL')
depends=('python2-lxml' 'python2-pyserial' 'desktop-file-utils' 'pygtk' 'curl' 'coreutils')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=($(curl -q 'http://trac.chirp.danplanet.com/chirp_daily/LATEST/SHA1SUM' | egrep $pkgname"-[0-9]{8}.tar.gz" | cut -c1-40))
source=("http://trac.chirp.danplanet.com/chirp_daily/LATEST/$pkgname-$pkgver.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

