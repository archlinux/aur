# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=(dosh
	 dosh-docker-shell
	 dosh-linux-amd64
	 dosh-linux-arm64
	 dosh-linux-arm
	 dosh-linux-ppc64le
	 dosh-linux-riscv64
	 dosh-linux-s390x
	 dosh-posh
	 dosh-cqfd
	 dosh-docker-cqfd)
pkgver=8
pkgrel=1
pkgdesc='Docker shell'
arch=(any)
url=https://github.com/gportay/dosh
license=(LGPL-2.1-or-later)
depends=(bash)
makedepends=(asciidoctor bash-completion)
checkdepends=(shellcheck)
source=("dosh-$pkgver.tar.gz::https://github.com/gportay/dosh/archive/$pkgver.tar.gz"
	"bash-completion-cqfd::https://raw.githubusercontent.com/savoirfairelinux/cqfd/v5.7.0/bash-completion")
sha256sums=('fb0d1e75cd0dc9ac0899a60c9bacd8faac7c38cb15599199089dc92e2f3d5116'
            '4af081815df72cde10579b085133f35734221680e3118883980cefe5d853bbb3')
validpgpkeys=(8F3491E60E62695ED780AC672FA122CA0501CA71)

build() {
	cd "dosh-$pkgver"
	make cqfd.1.gz cqfdrc.5.gz dosh.1.gz
}

check() {
	cd "dosh-$pkgver"
	make -k check
}

package_dosh() {
	depends+=(docker)
	optdepends+=(dosh-docker-shell)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-doc install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh/LICENSE"
}

package_dosh-docker-shell() {
	pkgdesc='Docker CLI plugin for dosh'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-docker-cli-plugin
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-docker-shell/LICENSE"
}

package_dosh-linux-amd64() {
	pkgdesc='Docker shell for linux/amd64 platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-amd64-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-amd64/LICENSE"
}

package_dosh-linux-arm64() {
	pkgdesc='Docker shell for linux/arm64 platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-arm64-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-arm64/LICENSE"
}

package_dosh-linux-arm() {
	pkgdesc='Docker shell for linux/arm platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-arm-dosh install-linux-arm-v6-dosh install-linux-arm-v7-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-arm/LICENSE"
}

package_dosh-linux-ppc64le() {
	pkgdesc='Docker shell for linux/ppc64le platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-ppc64le-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-ppc64le/LICENSE"
}

package_dosh-linux-riscv64() {
	pkgdesc='Docker shell for linux/riscv64 platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-riscv64-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-riscv64/LICENSE"
}

package_dosh-linux-s390x() {
	pkgdesc='Docker shell for linux/s390x platform'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install-linux-s390x-dosh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-linux-s390x/LICENSE"
}

package_dosh-posh() {
	pkgdesc='Podman shell'
	depends+=(dosh podman)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-posh
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-posh/LICENSE"
}

package_dosh-cqfd() {
	pkgdesc='Wrap commands in controlled Docker containers using dosh'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-cqfd
	install -D -m 644 "$startdir/bash-completion-cqfd" "$pkgdir$completionsdir/cqfd"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-cqfd/LICENSE"
}

package_dosh-docker-cqfd() {
	pkgdesc='Docker CLI plugin for cqfd'
	depends+=(dosh-cqfd)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-docker-cli-plugin-cqfd
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-docker-cqfd/LICENSE"
}
