# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=etcd-bin
_pkgname=etcd
pkgver=3.6.5
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery - binary version'
arch=('x86_64')
url='https://github.com/etcd-io/etcd'
license=('Apache')
provides=('etcd')
conflicts=('etcd' 'etcd-git')
backup=('etc/etcd/etcd.conf.yml')
install="etcd.install"
source=("https://github.com/etcd-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "https://github.com/etcd-io/${_pkgname}/raw/v${pkgver}/contrib/systemd/${_pkgname}.service"
        "https://github.com/etcd-io/${_pkgname}/raw/v${pkgver}/${_pkgname}.conf.yml.sample")
sha256sums=('66bad39ed920f6fc15fd74adcb8bfd38ba9a6412f8c7852d09eb11670e88cac3'
            '6b2921568bd96f5bb48ba61d2b9673f42e49eb90fda35a7003fbac469a226a13'
            '8972ae92788d38db7a7947d4baf943e63385a894658e9b361027e8a7f8893790')

package() {
  cd ${srcdir}
  install -Dm644 etcd.conf.yml.sample ${pkgdir}/etc/etcd/etcd.conf.yml
  install -Dm644 etcd.service ${pkgdir}/usr/lib/systemd/system/etcd.service
  cd "${_pkgname}-v${pkgver}-linux-amd64"
  install -Dm755 etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 etcdctl ${pkgdir}/usr/bin/etcdctl
}

# vim:set ts=2 sw=2 et:
