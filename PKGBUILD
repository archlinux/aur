# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt5-bin
pkgver=8.4.0
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
sha256sums=('149d7aa93a4272e21cf7ad01a517a1542d8385f5ce5665454da386310243fe44')

package() {
    local opt_dir="/opt/peazip-qt5-bin"
    local freedesktop_dir="${opt_dir}/res/share/batch/freedesktop_integration"

    install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/peazip"

    mv peazip_portable-${pkgver}.LINUX.Qt5.x86_64 "${pkgdir}/${opt_dir}"

    ln -s "${opt_dir}/peazip" "${pkgdir}/usr/bin"

    cp -r "${pkgdir}${opt_dir}"/res/share/copying/* -t "${pkgdir}/usr/share/licenses/peazip"

    install -Dm644 "${pkgdir}${opt_dir}/res/share/peazip_help.pdf" -t "${pkgdir}/usr/share/doc/peazip"

    install -Dm644 "${pkgdir}${freedesktop_dir}/"*.desktop -t "${pkgdir}/usr/share/applications"

    install -Dm644 "${pkgdir}${freedesktop_dir}/"peazip{,_alt}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "${pkgdir}${freedesktop_dir}/"peazip_{7z,rar,zip}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes"

    install -Dm644 "${pkgdir}${freedesktop_dir}/"peazip_{add,extract}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/actions"

    rm "${pkgdir}${opt_dir}/res/portable"
}
