# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>
# Based on http://ftp.linux.org.tr/slackware/slackware_source/a/zoo/zoo.SlackBuild

pkgname=zoo
pkgver=2.10
pkgrel=1
pkgdesc="archiving and compressing utility"
url=('http://rahul.rahul.net')
license=('custom')
arch=('i686' 'x86_64')
source=('http://ftp.linux.org.tr/slackware/slackware_source/a/zoo/zoo-2.10.tar.gz'
	'http://ftp.linux.org.tr/slackware/slackware_source/a/zoo/zoo_2.10-22.debian.tar.gz')
sha512sums=('ea50ce2f5d6dc3f7182152fa62d62e2bf38f87da1291cc5d807d91e6b6f13540c21edfe960d6ea941b9ee6632187151e2dd49b33107f9bd3be3b6a02ef778e53'
	'6fe7de492534a8b66bd1e1e02dc4cc3094a79cd5af7f631334695b268a9fb318667677e4c64f47fa527e6317afc3b3f12e70eff4a85e3562f1e0ef65769439b5')
options=(zipman)

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make clean || return 1
	for diff in $srcdir/debian/patches/*patch; do
		cat $diff | patch -p1 --verbose --backup --suffix=.orig || return 1
	done
	}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make linux || return 1
	}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	for file in zoo fiz; do
		install -Dm755 ${file} "${pkgdir}/usr/bin/${file}"
		install -Dm644 ${file}.1 "${pkgdir}/usr/share/man/man1/${file}.1"
	done
	install -Dm644 Copyright "${pkgdir}/usr/share/licenses/${pkgname}/Copyright"
	}
