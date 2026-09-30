# Maintainer: taotieren <admin@taotieren.com>

pkgbase=clouddrive-mediaserver-plugin-bin
pkgname=(
    clouddrive-mediaserver-plugin-bin 
    clouddrive-mediaserver-plugin-emby-bin
    clouddrive-mediaserver-plugin-jellyfin-bin
)
pkgver=1.0.5
pkgrel=3
epoch=
pkgdesc="CloudDrive2 companion plugin for Emby and Jellyfin — path-mapping discovery and cloud-aware library updates"
arch=('x86_64')
url="https://github.com/cloud-fs/clouddrive-mediaserver-plugin"
license=('GPL-3.0-or-later')
depends=()
makedepends=(
    clouddrive
    libarchive
    # emby-server
    jellyfin-server
)
optdepends=('clouddrive: Unlocking the Unlimited Possibilities of Cloud Storage')
backup=()
options=('!strip' '!debug' '!lto' 'emptydirs')
# install=
source=(
    "LICENSE-GPL-3.0::${url}/raw/refs/heads/main/LICENSE"
    "CloudDrive.MediaServer-Emby-${pkgver}.zip::${url}/releases/download/v${pkgver}/CloudDrive.MediaServer-Emby-${pkgver}.zip"
    "CloudDrive.MediaServer-Jellyfin-${pkgver}.zip::${url}/releases/download/v${pkgver}/CloudDrive.MediaServer-Jellyfin-${pkgver}.zip"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '8613e2046f08d215bf3847f66d4ba5858bd165abf70bf249b6d51f602b2e348c'
            '4873884e7c50798de87daae831fae62270b331de3d96d700db657f6ddc7ff343')
noextract=(
    CloudDrive.MediaServer-Emby-${pkgver}.zip
    CloudDrive.MediaServer-Jellyfin-${pkgver}.zip
)

package_clouddrive-mediaserver-plugin-bin() {
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        clouddrive
        clouddrive-mediaserver-plugin-emby-bin
        clouddrive-mediaserver-plugin-jellyfin-bin
    )
}

package_clouddrive-mediaserver-plugin-emby-bin() {
    pkgdesc="CloudDrive2 companion plugin for Jellyfin — path-mapping discovery and cloud-aware library updates"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        clouddrive
        emby-server
    )

    cd ${srcdir}
    _install_path="usr/lib/emby-server/plugins/"
    install -dm755 ${pkgdir}/${_install_path}

    bsdtar -xf "CloudDrive.MediaServer-Emby-${pkgver}.zip" -C ${pkgdir}/${_install_path}
    # chown -R emby:emby ${pkgdir}/${_install_path}

    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_clouddrive-mediaserver-plugin-jellyfin-bin() {
    pkgdesc="CloudDrive2 companion plugin for Emby — path-mapping discovery and cloud-aware library updates"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        clouddrive
        jellyfin-server
    )

    cd ${srcdir}
    _install_path="var/lib/jellyfin/plugins/CloudDrive_${pkgver}/"
    install -dm755 ${pkgdir}/${_install_path}

    bsdtar -xf "CloudDrive.MediaServer-Jellyfin-${pkgver}.zip" -C ${pkgdir}/${_install_path}
    chown -R jellyfin:jellyfin ${pkgdir}/${_install_path}

    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
