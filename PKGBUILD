# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd at gmail dot com>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=emerald0.9
_realname=emerald
pkgver=0.9.5
pkgrel=21
pkgdesc="Emerald window decorator (0.9 version)"
arch=('i686' 'x86_64')
url="http://www.compiz.org/"
license=('GPL')
depends=('compiz>=0.9.5' 'libwnck' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=(
  'emerald-themes: extra themes for Emerald'
  'ttf-droid: required for displaying international characters in the titlebar'
)
options=(!libtool)
conflicts=(${_realname})
provides=(${_realname}=${pkgver})
source=(https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8/+files/${_realname}_${pkgver}.orig.tar.gz
        fix-desktop-file.patch
        theme-manager-manpage.patch)
sha256sums=('07088bbe8045b5085df571d9e00cb8956dcf29428e9d61391f0afcadd306ac60'
            '4b856962a3e32cb22fc074d850b39f55d2f8c420c8c1f023863dd41aaaac4fcf'
            'ddedc2123676bde67464d795a5dd657d5d1f28949ffd8b374bdfbcfc4c4a0ce1')

prepare() {
  cd "$srcdir/${_realname}-${pkgver}"

  # correct desktop file and manpage
  patch -Np1 -i "${srcdir}/fix-desktop-file.patch"
  patch -Np1 -i "${srcdir}/theme-manager-manpage.patch"
}

build() {
  cd "$srcdir/${_realname}-${pkgver}"
  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_realname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

