pkgname=caitsith-tools
_basever=0.2
_timestamp=20170515
pkgver=${_basever}_${_timestamp}
pkgrel=2
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.osdn.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz"
	"http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz.asc"
        "caitsith-auditd.service")
sha256sums=('542cbfb60089d0c8410b773e30f19e487d418dd701b64b7b60fcb661aca0f6fb'
	'f058d61d874f450efe0ca9fc81c530b967e355800f079ed1bf82d3aaeecc24d3'
        'bcb87b74c937c17767412b8ba601fd5717923fb89c9caec57bcbcf11704d6d1e')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install

  _unitdir="$(pkg-config --variable=systemdsystemunitdir systemd)"
  install -Dm644 "${srcdir}/caitsith-auditd.service" \
    "${pkgdir}/${_unitdir}/caitsith-auditd.service"
}
