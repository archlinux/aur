# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=dowse-git
pkgver=81.e365694
pkgrel=1
pkgdesc='Minimalistic tool to configure the routing of a local area network'
arch=('any')
url='https://github.com/dyne/dowse'
license=('GPL')
depends=('zsh' 'privoxy' 'squid' 'dnsmasq' 'tor' 'daemontools' 'iptables' 'ebtables')
makedepends=('git')
conflicts=('dowse')
provides=('dowse')
backup=('usr/share/dowse/conf/network' 'usr/share/dowse/conf/settings')
install=dowse.install
source=('git://github.com/dyne/dowse.git'
        'dowse.sh'
        'dowse.service')
md5sums=('SKIP'
         '4d296e0099e15aa82fdf42fbe111dc5d'
         '112e9e1e5b0bee78abdd09dba2e7606d')

pkgver() {
  cd dowse
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd dowse
  install -d "${pkgdir}"/usr/share/dowse/conf
  install -m755 dowse "${pkgdir}"/usr/share/dowse/
  cp -r {modules,zlibs} "${pkgdir}"/usr/share/dowse/
  touch "${pkgdir}"/usr/share/dowse/conf/{network,settings}

  install -d "${pkgdir}"/usr/share/doc/dowse
  cp -r {conf,doc} "${pkgdir}"/usr/share/doc/dowse/

  install -D "${srcdir}"/dowse.sh "${pkgdir}"/usr/bin/dowse

  install -d "${pkgdir}"/usr/lib/systemd/system
  install "${srcdir}"/dowse.service "${pkgdir}"/usr/lib/systemd/system/
}
