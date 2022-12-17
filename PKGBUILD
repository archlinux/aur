# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='tcpslice'
pkgver='1.6'
pkgrel='1'
pkgdesc="A tool for extracting portions of packet-trace files generated using tcpdump's -w flag."
arch=('i686' 'x86_64')
url='https://www.tcpdump.org/'
_giturl="https://github.com/the-tcpdump-group/${pkgname}"
license=('BSD')
depends=('libpcap')
_srcdir="${pkgname}-${pkgver}"
source=(
  #"ftp://ftp.ee.lbl.gov/${pkgname}-${pkgver}.tar.gz"
  "${_giturl}/archive/refs/tags/${_srcdir}.tar.gz"
  'LICENSE'
)
_srcdir="${pkgname}-${_srcdir}"
md5sums=('2a18e9da13b1dee08b92d10a88a97c38'
         'a8c9bb95fd32da1c9fdf4b5825ba7628')
sha256sums=('b9143ed454d173e3bd5161406379bbb259f35f57adb37a1f8aa6aebd4cb9233f'
            '6f4b64754b831217eee983f787d3b278ae7e73e4563c52bfe69cf7b07566f588')

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --sbindir='/usr/bin' --prefix='/usr'
  fi
  make -s -j1 # too small to need this
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}"
  install -Dpm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" '../LICENSE'
  set +u
}
set +u
