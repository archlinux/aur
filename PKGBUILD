# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=doxypress-bin
pkgver=1.4.1
pkgrel=2
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
sha512sums=('0f1285e0613ff3a830ba9193f0aa42ec6f491d7731d2501d9c002019e0f46c352688b8d0f933f8287aa855ae0079fcae7dbe0eb317548bcd74c4f31502a5aa3d')
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
