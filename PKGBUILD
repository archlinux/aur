# Maintainer: Tobias Beeh <tobias beeh at tum de>

pkgname=eclipse-modeling-tools
pkgver=2020_12
pkgrel=1
pkgdesc="The Eclipse IDE with the Eclipse Modeling Tools as a standalone package (does not interfere with a standard Eclipse installation)"
url="https://www.eclipse.org/modeling"
arch=("x86_64")
license=("EPL")
depends=("java-environment>=8")
optdepends=("python")
options=(!strip)

source=(
    "https://www.eclipse.org/downloads/download.php?r=1&file=/technology/epp/downloads/release/${pkgver//_/-}/R/eclipse-modeling-${pkgver//_/-}-R-linux-gtk-${CARCH}.tar.gz"
    "eclipse-modeling.sh"
    "eclipse-modeling.desktop"
)

sha512sums=('8528b720bf9f5a19547c4258bf82c53bb58d6d9a62a1f02034665b10e2014b45697877c9e58e9428c28c2df4251b78659002f98e0fdc10929bfda7780f11db8d'
            'e3460b10b2424cec30ac05560451d9cd8cb221ba06e0781b3076e5fedbc2cc9756b3749691ed895349d0afb1f7da6910576e52a37a07490140e856210a1e03d0'
            '7662740ea565329b7a7960269c8e485a13016c39a5db16f5ba02290ce41aa6629b7effcfb472674d00c47b89114eea3c88ab755606ab68d35d0f4f4050e8a37e')

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse-modeling.sh" "${pkgdir}/usr/bin/eclipse-modeling"
    install -Dm644 "${srcdir}/eclipse-modeling.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse-modeling.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/eclipse-modeling"
}
