# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=esmtp
pkgver=1.2
pkgrel=7
pkgdesc="An easy SMTP forwarder."
arch=('x86_64')
url='http://esmtp.sourceforge.net'
license=('GPL')
depends=('libesmtp' 'openssl')
optdepends=('liblockfile: for esmtp-wrapper script'
            'procmail: for local mail delivery')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('79a9c1f9023d53f35bb82bf446150a72')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm0644 README "${pkgdir}/usr/share/doc/esmtp/README"
  install -Dm0644 sample.esmtprc "${pkgdir}/usr/share/doc/esmtp/sample.esmtprc"
  install -Dm0755 esmtp-wrapper "${pkgdir}/usr/share/esmtp/esmtp-wrapper"
  install -Dm0755 ylwrap "${pkgdir}/usr/share/esmtp/ylwrap"
}
