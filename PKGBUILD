# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=etcd-bin
_pkgname=etcd
pkgver=3.4.0
pkgrel=1
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
sha256sums=('a0be73869ef20989121b5c950c2bfc7bb58bfbd30d285cd3b367e51ecc63501f'
            'e107490b80d96494b9276c7478e2e4d368ef9254b50a7996ae9f3456ccc68e81'
            'd91862eedcd2d98523308dba0e4da4ce7a41554b74f52c62a9a69f175753da37')

package() {
  cd ${srcdir}
  install -Dm644 etcd.conf.yml.sample ${pkgdir}/etc/etcd/etcd.conf.yml
  install -Dm644 etcd.service ${pkgdir}/usr/lib/systemd/system/etcd.service
  cd "${_pkgname}-v${pkgver}-linux-amd64"
  install -Dm755 etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 etcdctl ${pkgdir}/usr/bin/etcdctl
}

# vim:set ts=2 sw=2 et:
