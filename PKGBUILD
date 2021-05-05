# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Self-hosted newsletter and mailing list manager with a modern dashboard"
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
backup=(etc/listmonk/config.toml)
install=${pkgname%-bin}.install
source=("https://github.com/knadh/${pkgname%-bin}/releases/download/v$pkgver-beta/${pkgname%-bin}_$pkgver-beta_linux_amd64.tar.gz")
sha256sums=('1137f572fd93b25034865cb638d169acb1bd9b87d6848c274405bc6108dad62c')
_sample_pw=TKByjizucIoex3mA

build() {
	rm -f config.toml
	./${pkgname%-bin} --new-config
	sed -i -e "/admin_password/s,\".+\",\"$_sample_pw\"," config.toml
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" ${pkgname%-bin}
	install -Dm600 -t "$pkgdir/etc/${pkgname%-bin}" config.toml
}
