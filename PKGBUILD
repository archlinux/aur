# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=kaiteki
pkgname="${_app_name}-bin"
pkgver=2023_18
pkgrel=1
pkgdesc="A comfy Fediverse client for microblogging instances, made with Flutter and Dart. Currently with simple Mastodon/Pleroma and Misskey support"
arch=('x86_64')
url='https://kaiteki.app'
license=('AGPL3')
provides=("${_app_name}")
depends=(glibc gcc-libs gtk3)
source=("${pkgname}-${pkgver}::https://github.com/Kaiteki-Fedi/Kaiteki/releases/download/weekly-${pkgver//_/-}/linux.zip")
sha256sums=('61e01e5c1149775316ced7033cc4c21bc4368b93e6f443bf842812ff3b3402c0')

package() {
    local _opt_app_dir="${pkgdir}/opt/${_app_name}"
    install -dm755 "${_opt_app_dir}"
    mv linux/{data,lib,"${_app_name}"} "${_opt_app_dir}"
    chmod 755 "${_opt_app_dir}/${_app_name}"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "${_opt_app_dir}/${_app_name}" "${pkgdir}/usr/bin/${_app_name}"

    install -Dm644 "${_opt_app_dir}/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${_app_name}.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_app_name}.desktop" << EOF
[Desktop Entry]
Type=Application
Version=${pkgver//_/-}
Name=Kaiteki
Comment=A comfy Fediverse client for microblogging instances.
Exec=/opt/${_app_name}/${_app_name}
Icon=${_app_name}
Terminal=false
EOF
}
