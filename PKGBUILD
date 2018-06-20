# Maintainer: Tobias Beeh <tobias beeh at tum de>

pkgname=eclipse-modeling-tools
pkgver=4.7.3a
pkgrel=1
pkgdesc="The eclipse IDE with the eclipse modeling tools as a standalone package (not directly interfering with a standard eclipse)"
url="https://www.eclipse.org/modeling"
arch=("x86_64")
license=("EPL")
depends=("java-environment>=8")
optdepends=("python")
options=(!strip)

source=(
    "http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/oxygen/3a/eclipse-modeling-oxygen-3a-linux-gtk-x86_64.tar.gz"
    "eclipse-modeling.sh"
    "eclipse-modeling.desktop"
)

sha512sums=(
    "c859e65bd2d824e70cec5f3b5f8617d6c59cf74ba703c3193290825577ce8d252f5530c4576df29cf1781ddc084eced762898de0ff23c0288765266dcda3696e"
    "99a4496cb02817f32ba6b0d14f9c5b4356f478840c0b44c65f60850bd286ac12832edad8ba0c3af00d524b7854f36f54cd8ca75147755c0ceb727d37168ebb25"
    "e3460b10b2424cec30ac05560451d9cd8cb221ba06e0781b3076e5fedbc2cc9756b3749691ed895349d0afb1f7da6910576e52a37a07490140e856210a1e03d0"
)

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse-modeling.sh" "${pkgdir}/usr/bin/eclipse-modeling"
    install -Dm644 "${srcdir}/eclipse-modeling.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse-modeling.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/eclipse-modeling"
}
