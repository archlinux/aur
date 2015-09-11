# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Nicolas Hureau <archlinux@kalenz.net>

pkgname=jadx
pkgver=0.6.0
pkgrel=3
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files'
url='https://github.com/skylot/jadx'
arch=('any')
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'gradle')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/skylot/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('a1a4488aee4580ae5fbafed856b118bacd875383bf8ac46d9408ecf9de851363408604125a60e5c5c5e065ed6594ba3bdd88aee2890ffe484c4ef58abf7f9366')

build() {
  cd ${pkgname}-${pkgver}
  gradle --gradle-user-home=. dist
}

package() {
  cd ${pkgname}-${pkgver}/build/jadx

  install -Dm 755 bin/jadx "${pkgdir}/usr/share/java/${pkgname}/bin/jadx"
  install -Dm 755 bin/jadx-gui "${pkgdir}/usr/share/java/${pkgname}/bin/jadx-gui"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${pkgname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/java/${pkgname}/bin/jadx "${pkgdir}/usr/bin/jadx"
  ln -s /usr/share/java/${pkgname}/bin/jadx-gui "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
