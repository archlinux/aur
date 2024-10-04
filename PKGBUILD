# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=doxypress-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="A fork of Doxygen, with improved output and support for clang parsing"
arch=('x86_64')
url="https://www.copperspice.com/documentation-doxypress.html"
license=('GPL-2.0-only')
makedepends=('patchelf')
depends=('clang' 'libxi' 'fontconfig' 'xcb-util-renderutil' 'xcb-util-wm' 'libxkbcommon-x11'
         'libglvnd' 'libxrandr' 'libxcursor' 'xcb-util-keysyms' 'libxinerama' 'libsm'
         'xcb-util-image' 'libjpeg-turbo')
provides=('doxypress')
conflicts=('doxypress')
replaces=('doxypress')
source=("https://download.copperspice.com/doxypress/binary/${pkgname%-bin}-${pkgver}-arch-x64.tar.bz2")
sha512sums=('b2a45f097d27176ca6297fd70859b31678586d6ad67addf08cd8be28751ba11aac983ea3833a279c247f3b7071b22ca69d63754720596750331ed630d416ea57')
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
