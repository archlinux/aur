# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-downloader-neo-git
_pkgname=gxde-downloader-neo
pkgver=1.1.6.r0.g13b585a
pkgrel=1
pkgdesc='Download manager for GXDE based on AriaNG and aria2'
arch=(any)
url='https://github.com/GXDE-OS/gxde-downloader-neo'
license=(GPL-3.0-or-later)
depends=(spark-webapp-runtime aria2 bash unzip python python-miniupnpc python-requests)
makedepends=(git)
provides=(gxde-downloader)
conflicts=(gxde-downloader)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g'
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

package() {
  # 对应 debian/install：src/* 原样装到根目录
  cp -a "$_pkgname"/src/. "$pkgdir/"
}
