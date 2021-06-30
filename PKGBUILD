# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=6.4.0
pkgrel=1
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
  source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
  sha256sums=('27ab948098bacdefac7191e78188ddd3d4f11c76a6f9fc95038769840cdd9087')
fi
if [ "$CARCH" = "x86_64" ]; then
	source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('fa76ee4cae1770c09b45afa3847dcdbbf0e85d5e6424639869734df0346c1ea5')
fi

source+=(
        "sensu-backend.service"
        "backend.yml.example"
      )
sha256sums+=(
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            '29cf533a6b324ede8f2d774954bdbf879d0bf4470244cba5e7fbe1b935c1c4e9'
          )


install=sensu-backend.install

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/sensu-backend" "${pkgdir}/usr/bin/sensu-backend"
    install -Dm0644 "sensu-backend.service" "${pkgdir}/usr/lib/systemd/system/sensu-backend.service"
    install -Dm0644 "backend.yml.example" "${pkgdir}/etc/sensu/backend.yml.example"
}
