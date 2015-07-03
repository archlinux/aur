# Contributor: Justin Wong <justin.w.xd(at)gmail(dot)com>
pkgname=npd6
pkgver=1.1.0
pkgrel=1
pkgdesc='A Linux daemon to provide a proxy service for IPv6 Neighbor Solcitations received by a gateway routing device.'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/npd6/npd6/'
source=("https://github.com/npd6/npd6/archive/${pkgver}.tar.gz"
        "npd6.service")
install=npd6.install
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
}

package() {
  cd ${srcdir}
  install -D -m 644 npd6.service ${pkgdir}/usr/lib/systemd/system/npd6.service

  cd ${pkgname}-${pkgver}
  install -D -m 755 npd6 ${pkgdir}/usr/bin/npd6
  install -D -m 644 etc/npd6.conf.sample ${pkgdir}/etc/npd6.conf.sample
  install -D -m 644 man/npd6.conf.5.gz ${pkgdir}/usr/share/man5/npd6.conf.5.gz
  install -D -m 644 man/npd6.8.gz ${pkgdir}/usr/share/man8/npd6.8.gz
}
md5sums=('75f09177c52b86ee82260bb6b1c726a5'
         '319cc4f814a322e6aa9032c4d0f41dc6')
