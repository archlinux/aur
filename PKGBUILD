# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli-beta
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/JonnyWong16/plexpy"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git' 'tautulli' 'plexpy')
provides=("tautulli")
replaces=("plexpy")
install='plexpy.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JonnyWong16/plexpy/archive/v$pkgver-beta.tar.gz" 
        'plexpy.service'
        'plexpy.install')
sha256sums=('0ae99b4be3ee8eec624008346e99ef954c509fb73ddf6b054b44a4b79d258905'
            '3f07ceae4c5a5c78b21af0ca9b3478f7a3bc7bb6f152021e05bf39c9a7155a78'
            '93d8bc219acc2781f14d832443bc226a4fa6cc751f5ecf5cac5a407187c69160')

prepare() {
	echo "v${pkgver}" > "${srcdir}/plexpy-${pkgver}-beta/version.txt"
}

package() {
	cd "${srcdir}/plexpy-${pkgver}-beta"
	install -Dm755 PlexPy.py "${pkgdir}/opt/plexpy/PlexPy.py"
	install -Dm644 pylintrc  "${pkgdir}/opt/plexpy/"
	install -Dm644 CHANGELOG.md "${pkgdir}/opt/plexpy/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plexpy/LICENSE"

	cp -a data/ lib/ plexpy/ "${pkgdir}/opt/plexpy/"

	install -Dm644 "${srcdir}/plexpy.service" "${pkgdir}/usr/lib/systemd/system/plexpy.service"
	install -Dm644 "version.txt" "${pkgdir}/opt/plexpy/"
}

