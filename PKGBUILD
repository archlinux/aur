# Maintainer: Ray Song <i at maskrayme dot me>

pkgname=wechatircd-git
_pkgname=wechatircd
pkgver=r78.f09520a
pkgrel=3
pkgdesc="IRC server capable of controlling Web WeChat"
arch=('i686' 'x86_64')
url="https://github.com/MaskRay/wechatircd"
license=('MIT')
depends=('python-aiohttp' 'python-configargparse')
optdepends=("python-ipython: pretty error messages with the '-d' option")
makedepends=('git')
provides=('wechatircd')
conflicts=('wechatircd')
source=('git+https://github.com/MaskRay/wechatircd.git' wechatircd.install)
backup=(etc/wechatircd/config)
install="$_pkgname.install"
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -ri 's/^#(http-root:)/\1/' config
}

package() {
  install -D "$_pkgname/wechatircd.py" "$pkgdir/usr/bin/wechatircd"
  install -Dm644 "$_pkgname/config" -t "$pkgdir/etc/wechatircd/"
  install -Dm644 "$_pkgname/injector.js" -t "$pkgdir/usr/share/wechatircd/"
  install -Dm644 "$_pkgname/wechatircd.service" -t "$pkgdir/usr/lib/systemd/system/"
}
