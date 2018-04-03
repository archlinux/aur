# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=onioff
pkgver=2.0
pkgrel=1
arch=('any')
pkgdesc="An onion url inspector for inspecting deep web links"
url="https://github.com/k4m4/onioff"
license=('MIT')
depends=('python2' 'python2-requests' 'python2-pysocks' 'python2-beautifulsoup4' 'python2-termcolor')
source=("https://github.com/k4m4/onioff/archive/v${pkgver}.tar.gz")
sha512sums=('aba9c8d2443a3d6e3610f84241bb2e965935e19702cda88210b7f0e7d3b397ab0f96aeb58e75fe61a7fa7c865ca81de24aef4ae852264397cd72cc039b171085')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|python$|python2|g' onioff.py
}

package() {
  cd ${pkgname}-${pkgver}
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 license "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}"

cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
cd /usr/share/${pkgname}
python2 onioff.py "\$@"
EOF
chmod 755 "${pkgdir}/usr/bin/${pkgname}"

}
