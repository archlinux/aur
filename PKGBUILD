# Maintainer: Yunhui Fu

pkgname="webui-aria2"
pkgver=20140225
pkgrel=1
pkgdesc="Aria2 Web UI in pure HTML/CSS/Javascirpt"
arch=(any)
url="https://github.com/ziahamza/webui-aria2"
license=("MIT")
makedepends=("git")
provides=("webui-aria2")
conflicts=("webui-aria2")
source=("apache.example.conf"
    "nginx.example.conf"
    "$pkgname.install")
install=$pkgname.install

_gitroot="https://github.com/ziahamza/webui-aria2.git"
_gitname="webui-aria2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir/usr/share/webapps/webui-aria2"
  cp -r * "$pkgdir/usr/share/webapps/webui-aria2"

  mkdir -p "$pkgdir/etc/webapps/webui-aria2"
  cp ../*.example.conf "$pkgdir/etc/webapps/webui-aria2"

  chown http:http -R "$pkgdir/usr/share/webapps/webui-aria2"
}

# vim:set ts=2 sw=2 et:
md5sums=('30500125861a5a0ccf6070aaec3eba51'
         '99649ccdbf8b8e17ba1a2534550a0848'
         'c5b1c527ba1a95cfeb4c8dd653cacd07')

