# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname="webui-aria2"
pkgver=r370.e48a7a7
pkgrel=1
pkgdesc="Aria2 Web UI in pure HTML/CSS/Javascirpt"
arch=(any)
url="https://github.com/ziahamza/webui-aria2"
license=("MIT")
makedepends=("git" "aria2c-daemon")
provides=("webui-aria2")
conflicts=("webui-aria2")

source=(
    "${pkgname}::git+https://github.com/ziahamza/webui-aria2.git"
    "apache.example.conf"
    "nginx.example.conf"
    "$pkgname.install"
    )

md5sums=('SKIP'
         '30500125861a5a0ccf6070aaec3eba51'
         '99649ccdbf8b8e17ba1a2534550a0848'
         'c5b1c527ba1a95cfeb4c8dd653cacd07'
         )

install=$pkgname.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"

  msg 'Preparing package ...'
  mkdir -p "$pkgdir/usr/share/webapps/webui-aria2"
  cp -r * "$pkgdir/usr/share/webapps/webui-aria2"

  mkdir -p "$pkgdir/etc/webapps/webui-aria2"
  cp ../*.example.conf "$pkgdir/etc/webapps/webui-aria2"

  chown http:http -R "$pkgdir/usr/share/webapps/webui-aria2"
}

# vim:set ts=2 sw=2 et: