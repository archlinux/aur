# Maintainer: Gijs Burghoorn <me@gburghoorn.com>
pkgname=lemurs
pkgver=0.3.2
pkgrel=1
pkgdesc="TUI Display/Login Manager"
arch=('x86_64')
url="https://github.com/coastalwhite/lemurs"
license=('MIT' 'APACHE')
makedepends=('git')
depends=('pam' 'systemd')
optdepends=('xorg-xauth')
conflicts=()
backup=('etc/lemurs/config.toml' 'etc/lemurs/variables.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coastalwhite/lemurs/releases/download/v${pkgver}/${pkgname}-${CARCH}-unknown-linux-gnu.tar.xz")
sha256sums=('3fca32c356bb5fe39e45538679b8271cb44195dd995a7d40cdcbe466640d37c7')

package() {
    cd "${pkgname}-${CARCH}-unknown-linux-gnu"

    install -Dm755 lemurs "${pkgdir}/usr/bin/lemurs"

	install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
	install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/APACHE"

	install -D -m644 extra/config.toml "${pkgdir}/etc/lemurs/config.toml"
	install -D -m755 extra/xsetup.sh "${pkgdir}/etc/lemurs/xsetup.sh"

	install -D -m644 extra/lemurs.pam "${pkgdir}/etc/pam.d/lemurs"
	install -D -m644 extra/lemurs.service "${pkgdir}/usr/lib/systemd/system/lemurs.service"
}
