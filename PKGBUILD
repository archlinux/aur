# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=shutu_client-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A new generation of 'AI intelligence' mind map"
arch=('x86_64')
url="https://shutu.cn/"
license=('unknown')
conflicts=('shutu_client')
depends=('nss' 'gtk3' 'alsa-lib')
provides=('shutu_client')

source_x86_64=("https://static.shutu.cn/client/download/ShuTu-Linux-${pkgver}.deb")
sha256sums_x86_64=('923bd86ab825a23aa31e0b8aaf04f56a3fd427c23f8f78a6fe31b9cf1eae30f3')

prepare() {
    cd "${srcdir}"
    /usr/bin/ar p "ShuTu-Linux-${pkgver}.deb" data.tar.xz | bsdtar xf -
}

package() {
    cd "${pkgdir}"
    cp -R "${srcdir}/opt" "opt"
    cp -R "${srcdir}/usr" "usr"

    # Rename the Chinese directory
    mv -f "opt/树图思维导图" "opt/shutu_client"

    chmod 4755 "opt/shutu_client/chrome-sandbox"
    # Modify the "Exec" but don't change the "Name"
    sed -i 's/树图思维导图\//shutu_client\//g' "usr/share/applications/shutu_client.desktop"

    mkdir -p "usr/bin"
    
    ln -sf "/opt/shutu_client/shutu_client" "usr/bin/shutu"
    ln -sf "/opt/shutu_client/shutu_client" "usr/bin/shutu_client"
}
