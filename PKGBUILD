# Maintainer: Pierre <pierre.jap@gmail.com>
pkgname=idphotomaker
pkgver=1.1.0
pkgrel=1
pkgdesc="Create official French Passport/ID Photos (35x45mm) compliant with ANTS standards"
arch=('any')
url="https://github.com/Djkawada/IDPhotoMaker"
license=('MIT')
depends=('python' 'python-pillow' 'tk')
makedepends=('git')
source=("https://github.com/Djkawada/IDPhotoMaker/archive/refs/tags/v${pkgver}.tar.gz"
        "idphotomaker.desktop")
sha256sums=('e8c93fe067aa7df78dfbbe3800c6ada42a583414fbb1dc6daa4752e3480b2715'
            'SKIP')

package() {
    cd "IDPhotoMaker-${pkgver}"

    # Install the script
    install -Dm755 id_photo_maker.py "${pkgdir}/usr/lib/${pkgname}/id_photo_maker.py"
    
    # Create a startup wrapper
    mkdir -p "${pkgdir}/usr/bin"
    echo "#!/bin/sh" > "${pkgdir}/usr/bin/idphotomaker"
    echo "exec /usr/bin/python3 /usr/lib/${pkgname}/id_photo_maker.py \"\$@\"" >> "${pkgdir}/usr/bin/idphotomaker"
    chmod 755 "${pkgdir}/usr/bin/idphotomaker"

    # Install Desktop File
    install -Dm644 "${srcdir}/idphotomaker.desktop" "${pkgdir}/usr/share/applications/idphotomaker.desktop"
}
