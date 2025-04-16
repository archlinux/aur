# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=bluelog-git
pkgver=r102.42c9154
pkgrel=1
_pkgname=bluelog
_dirname=Bluelog
pkgdesc="A highly configurable Linux Bluetooth scanner with optional web interface"
arch=(i686 x86_64)
url="https://github.com/MS3FGX/Bluelog"
license=('GPL-2.0-only')
makedepends=('wget')
depends=('bluez' 'bluez-libs')
source=("git+$url"
  "bluelog.patch")
sha256sums=('SKIP'
            '6d6e245edabad7df78414d0b0d3c17cd7ec959d3a3b8d869a40b01936284cf83')

pkgver() {
  cd "${srcdir}/${_dirname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd ${_dirname}
  patch -p1 < ../bluelog.patch
  make
}

package()
{
  cd ${_dirname}
  make DESTDIR="${pkgdir}/" install

  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dm644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
