# Maintainer: Ray Song <i at maskrayme dot me>

pkgname=webqqircd-git
_pkgname=webqqircd
pkgver=r25.3892627
pkgrel=1
pkgdesc="IRC server capable of controlling WebQQ (w.qq.com)"
arch=('i686' 'x86_64')
url="https://github.com/MaskRay/webqqircd"
license=('MIT')
depends=('python-aiohttp')
optdepends=("python-ipython: pretty error messages with the '-d' option")
makedepends=('git')
provides=('webqqircd')
conflicts=('webqqircd')
source=('git+https://github.com/MaskRay/webqqircd.git' webqqircd.install)
install="$_pkgname.install"
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D "$_pkgname/webqqircd.py" "$pkgdir/usr/bin/webqqircd"
  install -Dm644 "$_pkgname/mq.js" -t "$pkgdir/usr/share/webqqircd/"
  install -Dm644 "$_pkgname/webqqircd.service" -t "$pkgdir/usr/lib/systemd/system/"
}
