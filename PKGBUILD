# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamavgui
_pkgname=clamav-gui
pkgver=1.0.6
pkgrel=1
pkgdesc="This application provides a graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
url="https://github.com/wusel1007/clamav-gui"
arch=('x86_64')
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools'  'qt6-translations' 'qt5-x11extras' 'qt5-xmlpatterns' 'clamav' 'desktop-file-utils')
license=(GPLv3)
source=('git+https://github.com/wusel1007/clamav-gui'
        'fix_qt6.patch')
sha256sums=("SKIP"
            "3f86ee55e7cf580aab2f9c635156b6a421dfbbdd4574e45a494ce566d0717851")



build() {
mv ${_pkgname} ${pkgname}-${pkgver}
cd "${srcdir}/${pkgname}-${pkgver}"/src
patch -i ${srcdir}/fix_qt6.patch
cd "${srcdir}/${pkgname}-${pkgver}"
qmake6 PREFIX=/usr
make
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
make install DESTDIR=${pkgdir}

}

