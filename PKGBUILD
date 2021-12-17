# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.110
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
b2sums_x86_64=('8573a7da0ef305b70469408d1b1c1cd748bbb197f50a82d1fe07167b0328925d5ba80e7ae645164f187bbcdaa57c3c24f52a6840ac15d85f1653e185d25688a2')
b2sums_arm=('3ab1038779620084723d6de67424e754e73f2e14f8e780f1720b05b8621b873cf1e14d08de09350e2c468dfac5db3815989dc4c70ea852e9df111d40343f6225')
b2sums_armv7h=('48c24fafbd1d3f072ce971feb102b86386566d86f534894960fc6a112f97b638dfe53cfc3b32cb0c98d9225ab838756c212a1aabe41917239e5fc294533fb7cb')
b2sums_aarch64=('542684882536416e0625de236cbc1b441b65c3d28ae068ed6d71ce6c1d5ffdd1a2356b73afc065f7b17e3c9cade07574c5c023ec64efb605d6d5031d59b76e24')
b2sums_i686=('a865d1d25b6d28f8087cdacae7a9c8989d7bf2662442f9ecae1072cef723d43d2f8ba2c37a4a424cd7079612fc5dc2e842d8f0cb59afb0eb188a2bf63a42b3cc')
