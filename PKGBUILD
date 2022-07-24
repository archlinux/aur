# Maintainer: Haruue Icymoon <i@haruue.moe>

_iptables_pkgbase=iptables
_iptables_pkgver=1.8.8

pkgname=iptables-apply
pkgver=1.1
pkgrel=1
pkgdesc='A safer way to update iptables remotely'
arch=('any')
url="https://www.netfilter.org/projects/iptables/index.html"
license=('GPL2')
depends=('iptables')
source=("https://www.netfilter.org/projects/iptables/files/$_iptables_pkgbase-$_iptables_pkgver.tar.bz2")
sha1sums=('98783621a5e58ff55f83b1350523f3de41af621d')

package() {
  # BUG: FS#75401
  # https://bugs.archlinux.org/task/75401
  install -Dm755 \
      "$srcdir/$_iptables_pkgbase-$_iptables_pkgver/iptables/iptables-apply" \
      "$pkgdir/usr/local/bin/iptables-apply"

  sed -e 's,/etc/network/,/etc/iptables/,' \
      -e 's,\.up,,' \
      -i "$pkgdir/usr/local/bin/iptables-apply"

  ln -sf iptables-apply "$pkgdir/usr/local/bin/ip6tables-apply"
}
