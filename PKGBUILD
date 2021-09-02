# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.105
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
b2sums_x86_64=('6d3b6836596fbc519a81780b4ca51ad39493b076b70fc0f7de3aace46fde45165239070bc0bfcd791e3997ef4f3b532048dbefc9cc661787aaeb5839c3bef87f')
b2sums_arm=('839049026fe02c37b2dd5c9873c86aa8fffc6958f965bcfb718c67e9b20696b55d270e8670359a88fa34f677835a5c82e63d86b4b660053a81dcc0fbc8ebe690')
b2sums_armv7h=('ee2cb7006e8de8120c9cd7747301f5f146ec352a5262e5516cda13d228fc0f03dd80256ba1a76553f642bf6750f94e43a640a49d54079d1f84c3b24a69a0c324')
b2sums_aarch64=('fa92bb5f9fab58e401323fac82cda6adfc13d2c4898cc00817273fba15e8101065eadba992554eec3d79ff69b684548fd482e60c57e85276c40fd1903a3baef9')
b2sums_i686=('c72a17f86ea55db8507c3ab85ae7969c745c5d081fbb3e47cca19a710c11b5ecc55fb6a0d6897532da8643b624de9f66043958de72155c33ffca7b711cf0ecaa')
