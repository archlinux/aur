# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=sickmuse
pkgver=0.2.0
pkgrel=1
pkgdesc="Collectd RRD web graphing application"
arch=('any')
url="https://github.com/mlavin/sickmuse"
license=('BSD')
groups=()
depends=('python2' 'python2-tornado' 'python2-rrdtool')
makedepends=('python2-pip' 'sed')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://raw.githubusercontent.com/mlavin/sickmuse/76f4b835b06fd6a7e91c0c751f0c1f1491e77366/systemd/sickmuse.service')
md5sums=('131da6cab8bb67ff4b8cc37a1a4d001c')

package() {
  PIP_CONFIG_FILE=/dev/null pip2 install --isolated --root="$pkgdir" --ignore-installed --no-deps sickmuse==${pkgver}
  sed -i 's/\/var\/lib\/collectd\//\/var\/lib\/collectd\/rrd\//' ${srcdir}/sickmuse.service
  install -Dm644 ${srcdir}/sickmuse.service ${pkgdir}/usr/lib/systemd/system/sickmuse.service
}
