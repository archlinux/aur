# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli-beta
pkgver=2.0.6
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
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JonnyWong16/plexpy/archive/v$pkgver-beta.tar.gz" 
        'tautulli.service'
        'tautulli.install')
sha256sums=('0c3a85be4125258f3642343e460a09c82a6662385ba61d0f6e06ad86cb837d0f'
            '2e80d7e628b4b87c44db209360aecc0babbad3b214750da08c0c39021d330fb8'
            'd64f63ecada4d08349cd6bd1805416d7d542b345e7c2d6d6e02e0e7615bb2923')

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

	install -Dm644 "${srcdir}/tautulli.service" "${pkgdir}/usr/lib/systemd/system/tautulli.service"
	install -Dm644 "version.txt" "${pkgdir}/opt/plexpy/"
}

