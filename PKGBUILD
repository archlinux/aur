# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.103
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver-git")
depends=("glibc")
install=torrserver.install

source=("systemd.patch")
sysemd_source="https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service"

source_x86_64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64" $sysemd_source)
source_i686=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386" $sysemd_source)
source_arm=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5" $sysemd_source)
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7" $sysemd_source)
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64" $sysemd_source)

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

b2sums=('20d847419c499b2286abe6d12113443446feff6aa6c2dac5e60d4c1bbfb0845d682761bde2880eacb2f9b29c12f3213ef6f9f3ae7e141586bd8483da00b9f440')
b2sums_x86_64=('7e5a442830ab4786c42ed41484d39ca3cbadeb1c6e2ecbb8cd630348528c32a2ee3aacb01c5a646e861cf321f2a0a6577586548daa46ddb1317556510d63c770'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_arm=('62670c957caf6be78be448eb8164d06a8c5a8811ff24a64d7ea99a8b426911ca708509c86355a3ad9f51d6321e398ef20997aa6387cd1d36091906364ab50478'
            '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_armv7h=('5dc49390c2f2b4336c2bd3d295c3875a158b2263eeb77bba8b460fb2e4689fce1004f9154aee9e244303ba0ac33d714327eeb3258f7cee34e7585beca3c2cabb'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_aarch64=('839f89c3af364fa783a04ecc100a04b179607ca017c0ba76fc7dcbe3631217c23ac8f9f690b32f4a58846f1c6bc5d3f95e6f975e94e0bc8cc7055ecf7e8db939'
                '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_i686=('3eb289d4fcd28d69d33c124d820aa04b1d56f050bf5bb8273f3b39c086dd02d18315342b5335f6425fba193d0dbb9c243e912bccfbb79ae12f02c2e909fa2c5a'
             '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
