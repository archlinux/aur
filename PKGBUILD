# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.93
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
b2sums_x86_64=('e7f00d0b3d316997bce53edf9ab2fcb0f3308b14b8beeed01b31aa5f2cba6949b242953340079b3fc54a54b09f66073905fbdd8d57aacf094bd3a1c2b54a426f'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_arm=('0a46b1eaa22589dafd1ab6bf2571bdc7b7abe5beb067bb8aa0afa1fa28cfc9b3191e4ed5d6da918f26769aae5f8f0ff4e45d0075674628ba6aab241c7161b984'
            '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_armv7h=('6aa379e838bba7e8332d28126032e311f0ca3178e41e4027b97252f3e8d2c87da57e8319a0ddf92df3199d2da1ea609f99ee36c223c9748e9a2c8da61d01baea'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_aarch64=('a754008be00c217e582e668f42eabc688b60643bf66501b0526a23a72d220a6cfd3385220276984b3b17e6db8a8b2b3c4f9bbacbd5af8560b7cc29a6a8779f5f'
                '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_i686=('87a978338e4c884260f0cb1acdf2dab5fa35dd8845943964b764e1afdcaa21728f412c2bcb71800358bd869e05c2a2fa9f06015b81b1d99842e670f2f2d3e664'
             '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
