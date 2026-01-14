# Maintainer: drzee <info@drzee.net>
pkgname=amazon-ssm-agent-bin
pkgver=3.3.3598.0
pkgrel=1
pkgdesc="Amazon SSM Agent for managing EC2 Instances using the SSM APIs. See: https://aws.amazon.com/documentation/systems-manager/ for details"
arch=('x86_64')
url="https://github.com/aws/amazon-ssm-agent"
license=('APACHE')
groups=()
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(${pkgname}-${pkgver}-x86_64.deb::https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/${pkgver}/debian_amd64/${pkgname%-bin}.deb)
# Checksums
sha256sums=('c4a692c8d358f6ada0990e6c73342141fef98f99c294203c10a2a37633fe0cca')
noextract=()
# We set options here to superseed the default makepkg.conf options. We dont whant debug build or strip debug info from the package. Its not relevant for a binary repackage of the upstream package.
options=(!debug !strip)

prepare() {
  cd "$srcdir"
  tar -xf data.tar.gz

}


package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/usr/
  cp -R "${srcdir}"/usr/ "${pkgdir}"

  install -dm755 "$pkgdir"/etc/amazon/
  cp -R "${srcdir}"/etc/amazon/ "${pkgdir}/etc/"

  install -Dm644 \
      "$srcdir"/lib/systemd/system/amazon-ssm-agent.service \
      "$pkgdir"/usr/lib/systemd/system/amazon-ssm-agent.service
      
}

