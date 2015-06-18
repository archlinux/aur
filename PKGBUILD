# Contributor: Tomas Hetmer <tomas at hetmer dot net>
# Maintainer: Thomas Sarboni <max-k@post.com>

pkgname=qtadb
pkgver=0.8.0
pkgrel=2
pkgdesc="GUI for Android SDK/ADB, Android phone manager"
arch=('i686' 'x86_64')
url="http://qtadb.wordpress.com/"
license=('custom:proprietary')
install=${pkgname}.install
depends=('qt4' 'android-sdk-platform-tools')
source=("svn+http://svn.code.sf.net/p/${pkgname}/code/tags/${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('SKIP'
         '75874703002c52e58e98412362987f94'
         'e27b5da6b0b6ad185201ea073857da28')

build() {
    cd "${srcdir}/${pkgver}"
    qmake-qt4 || return 1
    make || return 1
}

package() {
    cd "${srcdir}/${pkgver}"
    install -Dm755 QtADB "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 otherFiles/qtadb.apk "${pkgdir}/usr/share/${pkgname}/qtadb.apk"
    install -Dm644 ${srcdir}/qtadb.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 ${srcdir}/qtadb.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=4 sw=4 et:
