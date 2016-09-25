# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=passtrust
pkgver=1.1
pkgrel=1
arch=('any')
pkgdesc="A Ruby-based tool that converts a simple passphrase into a secure password"
url="https://github.com/xorond/passtrust"
license=('MIT')
depends=('ruby' 'xclip')
makedepends=('ruby-bundler')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a743ab3569226e8216f933e83d24e325ed4c6ec16d97e08c49d4bc717d748bb950dd7be1b5a846724f45e87cabfe57ac50ece2e5eea1ba73ae0b7fe381d6bb37')

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}" && rm LICENSE
  cp -a --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgdir}/usr/share/${pkgname}"
  bundle install --deployment --with optional

cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
cd /usr/share/${pkgname}
./passtrust "\$@"
EOF
chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
