# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>
# Contributor: xeross <contact at xeross dot me>
# Contributor: codekoala <codekoala at gmail dot com>

pkgname=etcd
pkgver=2.1.1
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'i686')
url='https://github.com/coreos/etcd'
license=('Apache License 2')
makedepends=('go')
backup=('etc/conf.d/etcd')
provides=('etcdctl')
replaces=('etcdctl')
conflicts=('etcdctl')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.conf")
md5sums=('ea42b2109a688f74b2d4806c2fd1cfcc'
         'dabe32f9e766b935c075b832672b2a79'
         'a6043503d766097eb9fb0d0e142b96f3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./build
}

package() {
  install -Dm644 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/conf.d/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/etcd ${pkgdir}/usr/bin/etcd
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/etcdctl ${pkgdir}/usr/bin/etcdctl
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 ${srcdir}/${pkgname}-${pkgver}/Documentation/*.md -t ${pkgdir}/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
