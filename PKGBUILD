# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>

pkgname=bitronics-studio-5-bin
pkgver=5.3.8
pkgrel=3
pkgdesc="Software for \"Юный Нейромоделист\" setup by BiTronicsLab."
arch=('x86_64')
url="https://bitronicslab.com"
license=('custom')
depends=('fontconfig>=2.11.0'
         'freetype2>=2.6'
         'glibc>=2.17'
         'libdrm>=2.4.62'
         'libglvnd>=1.6.0' # debtap considered 'libegl>=7.8.1' for file /usr/lib/libEGL.so.1
         'libgl'
         'libx11'
         'libxcb>=1.10'
         'libxkbcommon>=0.5.0'
         'libxkbcommon-x11>=0.5.0'
         'gcc-libs'
         'xcb-util-image>=0.2.1'
         'xcb-util-keysyms>=0.4.0'
         'xcb-util-renderutil'
         'xcb-util-wm>=0.4.1'
         'zlib>=1.2.3.4')
install="${pkgname}.install"
source=("https://www.download.bitronicslab.com/YN/soft/BS_YN/linux/BTStudio5JN-5.3.8.deb"
        "LICENSE.pdf::https://www.dropbox.com/s/0cddobko2i7cp6z/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%B3%D0%BE%D0%B2%D0%BE%D1%80-%D0%BE%D1%84%D0%B5%D1%80%D1%82%D0%B0%20BiTronics%20Studio.pdf?dl=1")
sha512sums=('6bada78349ebc602baa2535cc02b4f75b8d50d570ab1b3c32a7cedf8f4ce3c2f6fd841230a2a0957e83e764de3d27ec0f87e029a3169c9a595232fca07799fd3'
            '673a619e8e75167cf8bb1da97bef806965c215955df697b44691e27b57544168c156d01d4c6e74109a3e221af619a697cee8139007e1ef15263d062a8cda8d91')

package(){
    # Extract package data
    mkdir -p "${srcdir}/data"
    tar -xJ -f data.tar.xz -C "${srcdir}/data" --no-same-owner

    # to ensure correct permissions we will install all files separately
    install -D -t "${pkgdir}/usr/bin" "${srcdir}/data/usr/bin/btstudio5jn"
    install -D -t "${pkgdir}/usr/share/applications" "${srcdir}/data/usr/share/applications/BTStudio5JN.desktop"
    install -m 0644 -D -t "${pkgdir}/usr/share/icons" "${srcdir}/data/usr/share/icons/btstudio5_jn.png"
    install -m 0644 -D -t "${pkgdir}/opt/BTStudio5/" "${srcdir}/data/opt/BTStudio5/BiTronics Studio user manual.pdf"
    install -m 0644 -D -t "${pkgdir}/usr/share/licenses/bitronics-studio-5-bin/" "${srcdir}/LICENSE.pdf"
}
