# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=doxypress-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A fork of Doxygen, with improved output and support for clang parsing"
arch=('x86_64')
url="https://www.copperspice.com/documentation-doxypress.html"
license=('GPL')
depends=('clang' 'libxi' 'fontconfig' 'xcb-util-renderutil' 'xcb-util-wm' 'libxkbcommon-x11'
         'libglvnd' 'libxrandr' 'libxcursor' 'xcb-util-keysyms' 'libxinerama' 'libsm'
         'xcb-util-image' 'libjpeg-turbo')
provides=('doxypress')
conflicts=('doxypress')
replaces=('doxypress')
source=("https://download.copperspice.com/doxypress/binary/${pkgname%-bin}-${pkgver}-arch-x64.tar.bz2")
sha512sums=('77265d18818c0fa16b84764e3b93e8ff231ab110256c9a0d06436dea2319944bcacd850f6198b4380fc81d6882d336a3665a6cd31b7894d7fc785c079def4f29')
noextract=("${pkgname%-bin}-${pkgver}-arch-x64.tar.bz2")

package() {
	cd "$srcdir"

    # setup PATH through profile.d
    install -d "${pkgdir}/etc/profile.d"
    echo "export PATH=\$PATH:/opt/${pkgname%-bin}" > "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh"
    chmod +x "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh"

    # unpack the archive
    install -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar --uname root --gname root -xf "${pkgname%-bin}-${pkgver}-arch-x64.tar.bz2" -C "${pkgdir}/opt/${pkgname%-bin}"
}
