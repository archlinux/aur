# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=dowse
pkgver=0.5
pkgrel=1
pkgdesc='Minimalistic tool to configure the routing of a local area network'
arch=('any')
url='https://github.com/dyne/dowse'
license=('GPL')
depends=('zsh' 'privoxy' 'squid' 'dnsmasq' 'tor' 'daemontools' 'iptables' 'ebtables')
backup=('usr/share/dowse/conf/network' 'usr/share/dowse/conf/settings')
install=${pkgname}.install
source=("https://releases.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        'dowse.sh'
        'dowse.service')
sha256sums=('3c818fa7ca54829c107cb324bb7419cfe4c88f087900c5c42a8e57fb69adffe2'
            'SKIP'
            'aa6072eac2bd0102697a1b8dcaa7d65535c60a93b5073cfb2fedeccab7660750'
            '55d07c0166c10a536190845e70ee68c781d47164050d51906639cc2016a7aaea')

package() {
	cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/share/dowse/conf
  install -m755 dowse "${pkgdir}"/usr/share/dowse/
  cp -r modules "${pkgdir}"/usr/share/dowse/
  touch "${pkgdir}"/usr/share/dowse/conf/{network,settings}

  install -d "${pkgdir}"/usr/share/doc/dowse
  cp -r {conf,doc} "${pkgdir}"/usr/share/doc/dowse/

  install -D "${srcdir}"/dowse.sh "${pkgdir}"/usr/bin/dowse

  install -d "${pkgdir}"/usr/lib/systemd/system
  install "${srcdir}"/dowse.service "${pkgdir}"/usr/lib/systemd/system/
}
