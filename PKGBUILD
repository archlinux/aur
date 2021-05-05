# Maintainer: WhriedPlanck

pkgname=clipd-bin
_pkgname=clipd
pkgver=1.0.1
pkgrel=1
pkgdesc="Clipd is a simple secure and cross-platform cloud clipboard application"
arch=(x86_64)
url="https://clipber.com"
license=('custom: clipber.com')
depends=('libnghttp2>=1.40.0' 'libbsd>=0.10.0' 'libev>=4.31' 'libevdev>=1.9.0' 'icu>=66.1'
         'libpng>=1.6.37' 'openssl>=1.1.1.f' 'libjpeg-turbo' 'libtiff>=4.1.0' 'libzip>=1.5.1'
	 'imagemagick>=6.9.10' 'mosquitto>=1.6.9' 'z3>=4.8.7')
source=("${_pkgname}_${pkgver}_amd64.deb::https://apt.clipber.com/debian/pool/main/c/clipd/clipd_1.0.1_amd64.deb")
sha256sums=('4d7db9bbc92c5f1c315e88910417322192170657305d5d4085d24af8b0982187')

package() {
    cd "${srcdir}"
    bsdtar --acls --xattrs -xpf data.tar.xz -C "${pkgdir}"

    cd "${pkgdir}"
    find . -type d -exec chmod 755 {} +
    chmod 755 usr/local/bin/clipd
    rm -rf "${pkgdir}"/usr/local/share/man

    ln -sf /usr/lib/libicuuc.so "${pkgdir}"/usr/local/lib/libicuuc.so.66
    ln -sf /usr/lib/libicui18n.so "${pkgdir}"/usr/local/lib/libicui18n.so.66
    ln -sf /usr/lib/libMagickCore-7.Q16HDRI.so "${pkgdir}"/usr/local/lib/libMagickCore-6.Q16.so.6
    ln -sf /usr/lib/libMagickWand-7.Q16HDRI.so "${pkgdir}"/usr/local/lib/libMagickWand-6.Q16.so.6
    ln -sf /usr/lib/libMagick++-7.Q16HDRI.so "${pkgdir}"/usr/local/lib/libMagick++-6.Q16.so.8
}
