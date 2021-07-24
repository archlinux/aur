# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt5-bin
pkgver=8.1.0
pkgrel=1
pkgdesc="File and archive manager, 7Z BR RAR TAR ZST ZIP files extraction utility"
arch=('x86_64')
url='https://peazip.github.io/peazip-linux.html'
license=('LGPL3')
provides=('peazip')
conflicts=('peazip')
depends=('qt5pas')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip_portable-${pkgver}.LINUX.x86_64.Qt5.tar.gz")
sha256sums=('99543d2cacc56c382164c296b7bbd1f1104216827fb8b20beddf02ea0091ec5b')

package() {
  _opt_dir="/opt/peazip-qt5-bin"
  _freedesktop_dir="${_opt_dir}/FreeDesktop_integration"
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  mv peazip_portable-${pkgver}.LINUX.x86_64.Qt5 "${pkgdir}/${_opt_dir}"
  ln -s "${_opt_dir}/peazip" "${pkgdir}/usr/bin"
  install -Dm644 "${pkgdir}/${_opt_dir}/copying.txt" -t "${pkgdir}/usr/share/licenses/peazip"
  install -Dm644 "${pkgdir}/${_freedesktop_dir}/peazip.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/${_freedesktop_dir}/peazip.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  sed -i 's/^same/appdata/' "${pkgdir}/${_opt_dir}/res/altconf.txt"
}
