# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>
pkgname=kupfer
pkgver=300
pkgrel=1
pkgdesc="Launcher application written in python. Similar to Gnome-Do / Launchy"
arch=('i686' 'x86_64')
url="https://kupferlauncher.github.io"
license=('GPL3')
depends=('libkeybinder3' 'python-dbus' 'python' 'python-cairo' 'libwnck3')
makedepends=('python2' 'intltool')
install=${pkgname}.install
source=("https://github.com/kupferlauncher/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha1sums=('5f858dbecb1f31da4b85f40fc6e445d9f16420e5')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  # fix man page generation
  sed -i 's_rst2man_&2_Ig' wscript

  export PYTHON="/usr/bin/python"
  /usr/bin/python2 waf configure --prefix=/usr \
                  --no-update-mime \
                  --no-update-icon-cache
  /usr/bin/python2 waf
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
 /usr/bin/python2 waf install -f --destdir="${pkgdir}"
}




