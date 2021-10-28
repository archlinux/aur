# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.109
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
b2sums_x86_64=('d075cdfe27bde7efbd13ed84cd3f7483fe7f1e06e13b185a09c9644272740315bc7e84fece07476e86c2630998fdd7e1e315735ae687fc564de0aec4c9c5d742')
b2sums_arm=('a7dd2924d63e8695d763ae0c8977cfc1b2199d6eb1a555354e2ea89c3903e7d582b6668080e21412c96a02563bd5d8a11f3f50a7f87f5887f2266d9c28ef8dd7')
b2sums_armv7h=('04d497de8cc90d3bea889ba36f260e6255848b96b0fa47895087275c50c82f52114ba8fbe56267bf601949772fb9178d4bd9d194ac807fecfce70e85a5a554f7')
b2sums_aarch64=('04e3ab9eb9360f31a39946409b39571f9961c1c519fa2b0d9b06e0ec259c0fa8c04749d88a0a9217bfe78165755494303bc1dc1f88764f1373e52996def1d896')
b2sums_i686=('4ec64339d3125ba147061e04d3b2bb0ade978c669646d6758a2f6e9238b0dae743f6e054f4aef49e27f53b3d01ff473f6aadf5c4d4a27bde3eb135f0a0895ba0')
