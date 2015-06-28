# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=policyd-weight
pkgdesk="Policy server for postfix"
pkgver=0.1.15_beta_2
pkgrel=1
arch=('i686' 'x86_64')
url="http://policyd-weight.org"
license=('GPL2')
depends=('perl' 'perl-net-dns')
install='policyd-weight.install'
source=('http://policyd-weight.org/policyd-weight'
  'policyd-weight.service'
  'policyd-weight.conf'
  'fix-dn_expand.patch')
sha256sums=('ef15bc87a84e8bfb9adf18ffc8fa02449600725aec6bd2d2e5bf1c153d24820b'
  '438fb8732843e1cff2df3cb43a756e190111503b565e4f1070d03c6b97076351'
  '07f25b9fded84ad5a9599df9b70023f469e0a10221a5875505ebe00ca3e67285'
  '994139640127a071601d1bcd8a480bdf1c38599706ae1f91ac273a3279b879ed')

prepare() {
  cd "${srcdir}/"
  patch -Np1 --follow-symlinks -i fix-dn_expand.patch
}

package() {
  cd "$srcdir/"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm555 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
