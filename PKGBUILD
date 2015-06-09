# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd at gmail dot com>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=emerald0.9
_realname=emerald
pkgver=0.9.5
pkgrel=15
pkgdesc="Emerald window decorator (0.9 version)"
arch=('i686' 'x86_64')
url="http://www.compiz.org/"
license=('GPL')
depends=('compiz' 'libwnck' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=(
  'emerald-themes: extra themes for Emerald'
)
options=(!libtool)
conflicts=(${_realname})
provides=(${_realname}=${pkgver})
replaces=('emerald-git')
install=${_realname}.install
source=(https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8/+files/${_realname}_${pkgver}.orig.tar.gz)
sha256sums=('07088bbe8045b5085df571d9e00cb8956dcf29428e9d61391f0afcadd306ac60')

build() {
  cd "$srcdir/${_realname}-${pkgver}"
  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_realname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

