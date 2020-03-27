# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
# Maintainer: Shichao Gao <xgdgsc at gmail dot com>
pkgname=dingtalk-electron
_pkgname=${pkgname//-/_}
pkgver=2.1.3
pkgrel=2
pkgdesc="钉钉Linux版本"
arch=('x86_64')
url="https://github.com/nashaofu/dingtalk#readme"
license=('MIT')
depends=('gconf' 'at-spi2-core' 'gtk3' 'libnotify' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss' 'libsecret')
source=("https://github.com/nashaofu/dingtalk/releases/download/v${pkgver}/dingtalk-${pkgver}-latest-amd64.deb")

package() {
	tar xJvf data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}"/opt/dingtalk
	mv "${pkgdir}/opt/钉钉"/* "${pkgdir}/opt/dingtalk"
	rmdir "${pkgdir}/opt/钉钉"

	sed -ine 's/^Exec=.*/Exec=\/opt\/dingtalk\/dingtalk/' "${pkgdir}"/usr/share/applications/dingtalk.desktop

	find "${pkgdir}" -type d | xargs chmod 755

	mkdir -p "${pkgdir}"/usr/local/bin/
	ln -sf /opt/dingtalk/dingtalk "${pkgdir}"/usr/local/bin/dingtalk

	find "${pkgdir}" -type f | xargs chown root:root
}

md5sums=('3ebab7695cf7461487088b5888790a80')
