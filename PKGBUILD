# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>
pkgname=plexpy
pkgver=1.2.16
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/drzoidberg33/plexpy"
license=('GPL')
depends=('python2')
conflicts=('plexpy-git')
provides=("plexpy")
install=('plexpy.install')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drzoidberg33/plexpy/archive/v$pkgver.tar.gz" 'plexpy.service' 'plexpy.install' 'welcome.html.patch')
sha256sums=('8a866c5c9dd0d4550422f0b0ebd4dfcedff369be09d1c24400e146780189f6c0'
         '007682d19b8573fed06d4f2017080519c6f26793aafba38f01f349627a6b36d5'
         '447c8e08beca653775a7a5d8743c395e058c4c149f864b14a084ff684f6081f8'
         'a9c1319185172379ae3bcfd01b4860b4405ffbac3165307c54e084251043ef9f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/welcome.html.patch"
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        install -Dm755 PlexPy.py "${pkgdir}/opt/plexpy/PlexPy.py"
        install -Dm644 pylintrc  "${pkgdir}/opt/plexpy/"
	install -Dm644 CHANGELOG.md "${pkgdir}/opt/plexpy/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plexpy/LICENSE"

        cp -a data/ lib/ plexpy/ "${pkgdir}/opt/plexpy/"

        install -Dm644 "${srcdir}/plexpy.service" "${pkgdir}/usr/lib/systemd/system/plexpy.service"
}

