# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=doxypress-bin
pkgver=1.4.2
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
sha512sums=('6ef02f1eb87209b9bcf283583a065109eeb053a6667d4f41ee57302b3ce8b67306d27a8e3976addb7c4f7e9faf246a683b87a3b18e75699323960518719e4daa')
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
