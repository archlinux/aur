# Maintainer: zrrzw <zrrzw05@gmail.com>

pkgname=meta-rules-dat-git
pkgver=20260624
provides=(${pkgname%-git}=${pkgver} ${pkgname%-git}-lite=${pkgver})
conflicts=(${pkgname%-git} ${pkgname%-git}-lite)
pkgrel=1
pkgdesc="rules dat files by MetaCubeX"
arch=(any)
url="https://github.com/MetaCubeX/${pkgname%-git}"
license=(GPL-3.0-or-later)
makedepends=('git' 'coreutils')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git switch release
  sha256sum -c *.dat.sha256sum
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  TZ="Asia/Shanghai" date -d "@$(git log -1 --format=%ct)" +%Y%m%d
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 -t "$pkgdir/etc/clash" *.dat
}
