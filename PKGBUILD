# Maintainer: Chih-Hsuan Yen <python -c "import base64; print(base64.b85decode(b'd0}obGBGkWD\`9eDXdppUAZKl1X>2ZIZ*2'))">
# Contributor: drzee <info@drzee.net>
pkgname=amazon-ssm-agent
pkgver=3.1.941.0
pkgrel=1
pkgdesc="Amazon SSM Agent for managing EC2 Instances using the SSM APIs."
arch=('x86_64')
url="https://aws.amazon.com/documentation/systems-manager/"
license=('APACHE')
groups=()
depends=('glibc')
makedepends=('go')
source=("https://github.com/aws/amazon-ssm-agent/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f32e1c3680e6b46b2d5d2f84e1ba8ca4')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build-linux
  make package-deb
}


package() {
  local debdir="$srcdir/$pkgname-$pkgver/bin/debian_amd64/debian"

  install -dm755 "$pkgdir"/usr/
  cp -R "${debdir}"/usr/ "${pkgdir}"

  install -dm755 "$pkgdir"/etc/amazon/
  cp -R "${debdir}"/etc/amazon/ "${pkgdir}/etc/"

  install -Dm644 \
      "$debdir"/lib/systemd/system/amazon-ssm-agent.service \
      "$pkgdir"/usr/lib/systemd/system/amazon-ssm-agent.service
      
}

