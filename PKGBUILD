# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=kaiteki
pkgname="${_app_name}-bin"
pkgver=2023_44
pkgrel=1
pkgdesc="A comfy Fediverse client for microblogging instances, made with Flutter and Dart. Currently with simple Mastodon, Pleroma, Misskey and Calckey support"
arch=('x86_64')
url='https://kaiteki.app'
license=('AGPL3')
provides=("${_app_name}")
depends=(glibc gcc-libs gtk3 libhandy)
source=("${pkgname}-${pkgver}::https://github.com/Kaiteki-Fedi/Kaiteki/releases/download/weekly-${pkgver//_/-}/linux.zip")
sha256sums=('b5299f302e25eac2aef47d3d9b723e5bc56e9862e86e3d6d694761645ec81fa4')

package() {
    local _opt_app_dir="/opt/${_app_name}"

    install -dm755 "${pkgdir}${_opt_app_dir}" "${pkgdir}/usr/bin/"

    mv linux/{data,lib,"${_app_name}"} "${pkgdir}${_opt_app_dir}"
    chmod 755 "${pkgdir}${_opt_app_dir}/${_app_name}"

    ln -s "${_opt_app_dir}/${_app_name}" "${pkgdir}/usr/bin/${_app_name}"

    install -Dm644 "${pkgdir}${_opt_app_dir}/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${_app_name}.png"

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
