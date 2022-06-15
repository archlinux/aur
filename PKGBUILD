# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=quartz-server
pkgver=0.2.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="libquartz server"
arch=(x86_64)
url="https://github.com/Bultek/quartz-server"
license=('BSD-2-Clause')
groups=("mrquantumoff")
depends=("openssl")
makedepends=('git' 'cargo' 'rust')
replaces=()
backup=()

source=("https://github.com/Bultek/quartz-server/archive/refs/tags/${_pkgver}.tar.gz" "quartz-server.service")
md5sums=('SKIP' 'SKIP')


build() {
	cd ${srcdir}/quartz-server-$pkgver
	cargo build -r
	
}

package() {
	cd "$srcdir/quartz-server-$pkgver"
	install -Dm755 -t "${pkgdir}/usr/bin/" target/release/quartz-server
      cd ..
      install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" quartz-server.service
	chmod +x ${pkgdir}/usr/bin/quartz-server
}
