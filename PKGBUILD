# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.106
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver")
depends=("glibc")
install=torrserver.install

source=("https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service" "systemd.patch")
source_x86_64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64")
source_i686=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386")
source_arm=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5")
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7")
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64")

case "$CARCH" in
  x86_64) _CARCH=amd64 ;;
  i686) _CARCH=386 ;;
  arm) _CARCH=arm5 ;;
  armv7h) _CARCH=arm7 ;;
  aarch64) _CARCH=arm64 ;;
  *) return 1 ;;
esac

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}/TorrServer-linux-${_CARCH}" "${pkgdir}/usr/bin/torrserver"
}

b2sums=('7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad'
        '20d847419c499b2286abe6d12113443446feff6aa6c2dac5e60d4c1bbfb0845d682761bde2880eacb2f9b29c12f3213ef6f9f3ae7e141586bd8483da00b9f440')
b2sums_x86_64=('449d66be1c17188b571940d74abb06e7be21e7e67c6df73fbb5a2589e2419e9245219867fcdb82cd1fdf6af76a2d8ad0390f3ced163ce2ec3e6188fb24a20c8c')
b2sums_arm=('26d2309864c8fc7d8d523497d44782b1a78cb1bfa6cf915426c482aecbf768944153a48d2932fccae4399a83d3b2acf749cdd7c17540a28ae095931e38e11854')
b2sums_armv7h=('fbaf8ee27ba6b76daba850eb7f2032750a786e74714ca3965b52dca39938edcf840b115695a23e3fab82ebc2e073d853d6960fcb88258015549cbc26811a7dfc')
b2sums_aarch64=('5a849b4a3a19f64a666059ebc0d49b402eacaefa5396aa0f86ac1da7877ff5bf4fb453a0e06478f2e0b613b4de820e0c51d01e8dee4e2ffdc719a15403ab2e9c')
b2sums_i686=('22ea8842b34769ed9cedc4f231e563e45cca1bc3798870c294d0fb067394a53190bf5782be290c40961bbd952fa4da43c384b9dd71eb707b4ce9400b9dab9397')
