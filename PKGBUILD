# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=doxypress-bin
pkgver=1.5.0
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
sha512sums=('f58c4844ece6762d6fd5c7748502f203e1bcf7ec5c83e8dbd043b6cb46ecaee6f1368b7729c25d112e84a1bf6eb998dc3a5405a28fe76d036fe9f2bf3d02c9b3')
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
