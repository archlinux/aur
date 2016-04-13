# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>
# Contributor: xeross <contact at xeross dot me>
# Contributor: codekoala <codekoala at gmail dot com>

pkgname=etcd
pkgver=2.3.1
pkgrel=1
pkgdesc='A highly-available key value store for shared configuration and service discovery.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/coreos/etcd'
license=('Apache')
makedepends=('go')
backup=('etc/conf.d/etcd' 'usr/lib/systemd/system/etcd.service')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.conf")
md5sums=('451c988edd824367b6063e2c4f734d3c'
         '1ccf13f8b80f10e21e92361a4dea1a44'
         'bd315606b36e519c578db34722b57622')

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
