#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-git
epoch=1
pkgver=0.8.1.r67.g158c666
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar ("
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-git')
depends=('thunar-git' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%\.r*}")
options=('!libtool')
source=("${_pkgname}::git+https://github.com/andreldm/thunar-volman"
        'missing_parenthesis.patch')
#source=("${_pkgname}::git://git.xfce.org/xfce/thunar-volman")
sha256sums=('SKIP'
            '96564d3cde55ae449a04b7016054c0bf1a8962c928f44d37247028f3fa836a64')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^${_pkgname}.//;s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -uNp2 -r- -i ../missing_parenthesis.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
