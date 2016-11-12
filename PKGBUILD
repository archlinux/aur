# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=plexpy
pkgver=1.4.15
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/JonnyWong16/plexpy"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git')
provides=("plexpy")
install='plexpy.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JonnyWong16/plexpy/archive/v$pkgver.tar.gz" 
        'plexpy.service'
        'plexpy.install')
sha256sums=('29f50b8ddd80c9de979a018424047955474b00593c0d27823b77bf243334f7d2'
            '3f07ceae4c5a5c78b21af0ca9b3478f7a3bc7bb6f152021e05bf39c9a7155a78'
            '93d8bc219acc2781f14d832443bc226a4fa6cc751f5ecf5cac5a407187c69160')

prepare() {
	echo "v${pkgver}" > "${srcdir}/${pkgname}-${pkgver}/version.txt"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 PlexPy.py "${pkgdir}/opt/plexpy/PlexPy.py"
	install -Dm644 pylintrc  "${pkgdir}/opt/plexpy/"
	install -Dm644 CHANGELOG.md "${pkgdir}/opt/plexpy/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plexpy/LICENSE"

	cp -a data/ lib/ plexpy/ "${pkgdir}/opt/plexpy/"

	install -Dm644 "${srcdir}/plexpy.service" "${pkgdir}/usr/lib/systemd/system/plexpy.service"
	install -Dm644 "version.txt" "${pkgdir}/opt/plexpy/"
}

