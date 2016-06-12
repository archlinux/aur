# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=plexpy
pkgver=1.4.6
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/drzoidberg33/plexpy"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git')
provides=("plexpy")
install='plexpy.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/drzoidberg33/plexpy/archive/v$pkgver.tar.gz" 
		'plexpy.service'
		'plexpy.install')
sha256sums=('3750af652629726d43d9f16950ec6cf2f50a1a2ff04ef7aa71f1a7f1cffad208'
         '58300f84762f1362ae4d81aab9bbdf48425735b886807fea847ec256082524a0'
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

