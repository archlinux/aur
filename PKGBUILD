# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.104
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
b2sums_x86_64=('317014787256b5322a1fdbf0651f3624fc7f1ad3121b69119d4b077555b33cfcd9486aea05eb923ebac77f1e484e8df66dfdf2eace89a21f08ec4cc70a549f4d')
b2sums_arm=('a0962e160a7ee98f4d0afaccbc6ee636195fcc230c6a126088d9ea8c5efe7c9f60c20603f8f0f43ff681642ca0d7b4c732e833aed952e634789b26597b2804a9')
b2sums_armv7h=('882420d7f970a2fc86c05850beb7af6983bca5dc74df3507dcd181d8a7bc9827a002595e1aa8849a294fb2c51dab9b6a7348c4d33196b0eb29a2df30aaf64e81')
b2sums_aarch64=('14cc4647f1d10c03279451858dbd665c5f1147f0562ce201661cf61eb3a1e9f9512eea556a33082fe49b4bbec6bcdefdabe59cf45f745e5f0243f22365c41ca7')
b2sums_i686=('d460b94d3b5b0b7fb12624898ee11d660128928b6c6c3b758d97e5a59b6b906fe8e288bc6aa4d74d8d82c21d334168580381d6ec2f126b33eaf302742b067765')
