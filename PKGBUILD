# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt5-bin
pkgver=8.2.0
pkgrel=1
pkgdesc="File and archive manager, 7Z BR RAR TAR ZST ZIP files extraction utility"
arch=('x86_64')
url='https://peazip.github.io/peazip-linux.html'
license=('LGPL3')
provides=('peazip')
conflicts=('peazip')
depends=('qt5pas')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip_portable-${pkgver}.LINUX.Qt5.x86_64.tar.gz")
sha256sums=('f8e673960be5270f4763d7613646882b061f0188ade23df7953d3c5466232e21')

package() {
    local opt_dir="/opt/peazip-qt5-bin"
    local freedesktop_dir="${opt_dir}/res/batch/freedesktop_integration"

    install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"

    mv peazip_portable-${pkgver}.LINUX.Qt5.x86_64 "${pkgdir}/${opt_dir}"

    ln -s "${opt_dir}/peazip" "${pkgdir}/usr/bin"

    install -Dm644 "${pkgdir}/${opt_dir}/copying.txt" -t "${pkgdir}/usr/share/licenses/peazip"

    install -Dm644 "${pkgdir}/${opt_dir}/peazip_help.pdf" -t "${pkgdir}/usr/share/doc/peazip"

    for file in "${pkgdir}/${freedesktop_dir}/"*.desktop; do
        install -Dm644 "$file" -t "${pkgdir}/usr/share/applications"
    done

    for file in "${pkgdir}/${freedesktop_dir}/"peazip{,_alt}.png; do
        install -Dm644 "$file" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    done

    for file in "${pkgdir}/${freedesktop_dir}/"peazip_{7z,rar,zip}.png; do
        install -Dm644 "$file" -t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes"
    done

    for file in "${pkgdir}/${freedesktop_dir}/"peazip_{add,extract}.png; do
        install -Dm644 "$file" -t "${pkgdir}/usr/share/icons/hicolor/256x256/actions"
    done

    sed -i 's/^same/appdata/' "${pkgdir}/${opt_dir}/res/altconf.txt"
}
