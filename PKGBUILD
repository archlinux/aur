# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>

set -u
pkgname='jp2a'
pkgver='1.0.7'
pkgrel='1'
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('i686' 'x86_64' 'armv7h')
#url='http://jp2a.sourceforge.net/'
url='https://github.com/cslarsen/jp2a'
license=('GPL')
depends=('curl' 'libjpeg')
_github='cslarsen'
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" '\s\+<title>v\([0-9\.]\+\)</title>.*' 'f')
source=("jp2a-${pkgver}.tar.gz::https://github.com/cslarsen/jp2a/archive/v${pkgver}.tar.gz")
sha256sums=('e509d8bbf9434afde5c342568b21d11831a61d9942ca8cb1633d4295b7bc5059')

build(){
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    if [ ! -s 'configure' ]; then
      autoreconf -fi
    fi
    ./configure --prefix='/usr'
  fi
  make
  set +u
}

check_disabled() {
  set -u
  cd "${pkgname}-${pkgver}"
  make test
  set +u
}

package(){
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
