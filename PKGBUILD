# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli-beta
pkgver=2.0.18
pkgrel=2
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Tautulli/Tautulli"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git' 'tautulli' 'plexpy')
provides=("tautulli")
replaces=("plexpy")
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tautulli/Tautulli/archive/v$pkgver-beta.tar.gz" 
        'tautulli.service'
        'tautulli.install')
sha256sums=('a20ee2910892ae32d9579331fff762a74efed13f5e40f2a11a6679faab10a6c6'
            '7aaf4461f0798bf12553eb647b8ee6b0553b38e23673cf78f5514e6d416512f4'
            'd0f434fbcfc7cfd067d457a7195e6856079b48ad62a941ade8229633c4323afd')

prepare() {
	echo "v${pkgver}" > "${srcdir}/Tautulli-${pkgver}-beta/version.txt"
}

package() {
	cd "${srcdir}/Tautulli-${pkgver}-beta"
	install -Dm755 PlexPy.py "${pkgdir}/opt/tautulli/PlexPy.py"
	install -Dm644 pylintrc  "${pkgdir}/opt/tautulli/"
	install -Dm644 CHANGELOG.md "${pkgdir}/opt/tautulli/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/tautulli/LICENSE"

	cp -a data/ lib/ plexpy/ "${pkgdir}/opt/tautulli/"

	install -Dm644 "${srcdir}/tautulli.service" "${pkgdir}/usr/lib/systemd/system/tautulli.service"
	install -Dm644 "version.txt" "${pkgdir}/opt/tautulli/"
}

