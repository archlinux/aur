# Maintainer: Ray Song <i at maskrayme dot me>

pkgname=wechatircd-git
_pkgname=wechatircd
pkgver=r32.9732b27
pkgrel=1
pkgdesc="IRC server capable of controlling Web WeChat"
arch=('i686' 'x86_64')
url="https://github.com/MaskRay/wechatircd"
license=('MIT')
depends=('python-aiohttp')
optdepends=("python-ipython: pretty error messages with the '-d' option")
makedepends=('git')
provides=('wechatircd')
conflicts=('wechatircd')
source=('git+https://github.com/MaskRay/wechatircd.git' wechatircd.service wechatircd.install)
install="$_pkgname.install"
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D "$_pkgname/wechatircd.py" "$pkgdir/usr/bin/wechatircd"
  install -Dm644 "$_pkgname/webwxapp.js" -t "$pkgdir/usr/share/wechatircd/"
  install -Dm644 wechatircd.service -t "$pkgdir/usr/lib/systemd/system/"
}
