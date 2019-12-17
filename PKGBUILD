# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=5.16.0
pkgrel=1
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
#makedepends=('')
source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz"
        "${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz"
        "sensu-backend.service"
        "backend.yml"
      )
sha256sums=(
            '8bc8da4a6a38b39b9611fe232a935936064b4186fb191d419b1543e2affc48cb'
            'bad0512865be732b56eda0bb694ad4206e30d0a44934881c677ebd5453e82321'
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            'ab565da7d63fe7157651a5c1745804b34e8d585fdb0c2c0768a257d1f1a3539f'
          )


build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
post_install() {
  groupadd sensu
  useradd -s /sbin/nologin -d /opt/sensu -G sensu sensu
}

package() {
    install -Dm755 "${srcdir}/sensu-backend" "${pkgdir}/usr/bin/sensu-backend"
    install -Dm0644 "sensu-backend.service" "${pkgdir}/usr/lib/systemd/system/sensu-backend.service"
}

