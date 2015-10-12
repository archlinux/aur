# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Marc Straube <email@marcstraube.de>

pkgname=policyd-weight
pkgdesk="Policy server for postfix"
pkgver=0.1.15_beta_2
pkgrel=2
arch=('i686' 'x86_64')
url="http://policyd-weight.org"
license=('GPL2')
depends=('perl' 'perl-net-dns')
install='policyd-weight.install'
source=('http://policyd-weight.org/policyd-weight'
  'policyd-weight.service'
  'policyd-weight.conf'
  '01-policyd-weight-freebsd.patch')
sha256sums=('ef15bc87a84e8bfb9adf18ffc8fa02449600725aec6bd2d2e5bf1c153d24820b'
            '438fb8732843e1cff2df3cb43a756e190111503b565e4f1070d03c6b97076351'
            '07f25b9fded84ad5a9599df9b70023f469e0a10221a5875505ebe00ca3e67285'
            '28d42ef2b3e3b3a4a6018228642db10f089178d56ae3a8cbb0cc0277f893ded7')

prepare() {
  cd "${srcdir}/"
  patch -Np0 --follow-symlinks -i 01-policyd-weight-freebsd.patch
}

package() {
  cd "$srcdir/"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm555 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
