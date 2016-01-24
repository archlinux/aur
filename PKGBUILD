# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>
pkgname=plexpy
pkgver=1.3.1
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
sha256sums=('58c2cd8f615a0ab4f4eb0606a7b526e35b0d0a48eeb54d022f401215b9f9a7e9'
         '007682d19b8573fed06d4f2017080519c6f26793aafba38f01f349627a6b36d5'
         '447c8e08beca653775a7a5d8743c395e058c4c149f864b14a084ff684f6081f8'
         'b1afd608a30595c85de0ea0ad3dea05ec6609287e9bb15847934c1d511a3a04d')

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

