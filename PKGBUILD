# Maintainer: Pierre <pierre.jap@gmail.com>
pkgname=idphotomaker
pkgver=1.0.1
pkgrel=1
pkgdesc="Create official French Passport/ID Photos (35x45mm) compliant with ANTS standards"
arch=('any')
url="https://github.com/Djkawada/IDPhotoMaker"
license=('MIT')
depends=('python' 'python-pillow' 'tk')
makedepends=('git')
source=("https://github.com/Djkawada/IDPhotoMaker/archive/refs/tags/v${pkgver}.tar.gz"
        "idphotomaker.desktop")
sha256sums=('6a0c735a6dcd16abf0c91076c3b4ec2f5a53500a8c41a79ce722cc3200fce8cf'
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

    # Install Desktop File (We create one or use the one from source if available, but source has it in install.sh, not as a standalone file usually)
    # The source repo doesn't have a standalone .desktop file (it's generated in install.sh).
    # So we should include one in the source array or generate it here.
    # I included 'idphotomaker.desktop' in source array, so I must create it.
    install -Dm644 "${srcdir}/idphotomaker.desktop" "${pkgdir}/usr/share/applications/idphotomaker.desktop"

    # License
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # No LICENSE file in repo yet?
}
