# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=plexpy
pkgver=1.3.15
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
		'plexpy.install'
		'welcome.html.patch')
sha256sums=('5cbd357ec45fd181486854100552cd0ac2b78040429ac5b8a9b93f89293cb892'
         '58300f84762f1362ae4d81aab9bbdf48425735b886807fea847ec256082524a0'
         '93d8bc219acc2781f14d832443bc226a4fa6cc751f5ecf5cac5a407187c69160'
         'e8203e18bb168ae50401cb7afacbc5e0e9b0adc9fa1322c7744018b9f8ac1d32')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/welcome.html.patch"
	echo "v${pkgver}" > version.txt
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

