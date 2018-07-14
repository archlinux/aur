# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=etcd-bin
_pkgname=etcd
pkgver=3.3.8
pkgrel=2
pkgdesc='A highly-available key value store for shared configuration and service discovery - binary version'
arch=('x86_64')
url='https://github.com/coreos/etcd'
license=('Apache')
provides=('etcd')
conflicts=('etcd' 'etcd-git')
backup=('etc/etcd/etcd.conf.yml')
install="etcd.install"
source=("https://github.com/coreos/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "https://github.com/coreos/${_pkgname}/raw/v${pkgver}/contrib/systemd/${_pkgname}.service"
        "https://github.com/coreos/${_pkgname}/raw/v${pkgver}/${_pkgname}.conf.yml.sample")
sha256sums=('a1e9d30312f712f714be3d09b242b901a531dd9472351425c1e712ba740012a4'
            '400b28d6e643d1f60d89813e7acdf6b80c9bee42711e650a058101e7746173e9'
            '6a70e5dc62bef30600a6b13f7baaa2a173299a3648b6e8c1adecd095f3a5d6c1')

package() {
  cd ${srcdir}
  install -Dm644 etcd.conf.yml.sample ${pkgdir}/etc/etcd/etcd.conf.yml
  install -Dm644 etcd.service ${pkgdir}/usr/lib/systemd/system/etcd.service
  cd "${_pkgname}-v${pkgver}-linux-amd64"
  install -Dm755 etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 etcdctl ${pkgdir}/usr/bin/etcdctl
}

# vim:set ts=2 sw=2 et:
