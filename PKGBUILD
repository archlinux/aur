# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>

pkgname=shadowsocks-heroku-git
pkgver=r80.822994e
pkgrel=1
pkgdesc="shadowsocks over WebSocket, support Heroku."
arch=('any')
url='https://github.com/mrluanma/shadowsocks-heroku'
license=('MIT')
makedepends=('git' 'nodejs'  'npm')
source=(
    "${pkgname}::git+git://github.com/mrluanma/shadowsocks-heroku.git"
    "shadowsocks-heroku@.service"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "shadowsocks-heroku@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-heroku@.service"

  cd "${srcdir}/${pkgname}"
  install -Dm644 "config.json" "${pkgdir}/etc/shadowsocks/heroku.json"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  npm install
  mkdir -p "${pkgdir}/opt/shadowsocks-heroku/"
  cp  -r * "${pkgdir}/opt/shadowsocks-heroku/"
}