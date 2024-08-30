# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=23.3.0
pkgrel=1
pkgdesc='Greenbone Security Assistant'
arch=('x86_64')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gvm-libs' 'libgcrypt' 'gnutls' 'postgresql' 'libxml2' 'libmicrohttpd' 'openvas-scanner')
makedepends=('yarn' 'doxygen' 'xmltoman' 'nodejs' 'npm')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "gsad.service"
        "gsad")
sha512sums=('d9eaa282ba4babf3f42939f4918b5726fa539e4c4fe64e89ae77cf1887b2f10d5a97f085b168264e7b23c468f194e0c58c565ee86458812065947a4d96c43788'
            '6c65e3ea08b427cd1773c346b054b7b1a3e95d06d6d4070603e97f92b59f9dd465e94992cd6b5927192bc9b859c1268d1cda8d92d4067264389a7a0a578b9d30'
            '27542d6e194d8fe4ef37364f387293d69f4c7002f2b380b8a21ae995122531ccbce6ca689f0768c463252d33cf0b1735343cbe61eac51947fbec0e05a45e1d1b')
backup=("etc/default/gsad")


build() {
  cd "${pkgname}-${pkgver}"
  yarn
  yarn build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d $pkgdir/usr/share/gvm/gsad/web
  cp -r build/* $pkgdir/usr/share/gvm/gsad/web/
  install -d $pkgdir/etc/default
  install -m 644 $srcdir/gsad $pkgdir/etc/default
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/gsad.service $pkgdir/usr/lib/systemd/system
}
