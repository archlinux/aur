# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.114
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
b2sums_x86_64=('d9e0227f3bacf785a39e941b2ea39c77b7b9b10e24468fb3b0a37b518ea8a3c178e6a6cd6b82cbde5207dac498dbc378876dcb05bb2a7f47feb5f5a9885a8560')
b2sums_arm=('be1c7705b37bdfa1b2b24f98ce7a36279c8d32b9bffb7b250e78c7c580c40a39b4e6914db2135719d185053c137be419da05a4fe999c329cf27f29b7d25e8311')
b2sums_armv7h=('bbb68ffe15b2142cefcf05043998fb20f985e4449857300078912e1e200e522ca463b14ccc20fb8f68fc8aaa8d977602597b1497ab69b518418a531d05392ad5')
b2sums_aarch64=('ec9032ff2b2bff6f523c291efbd8f0eceac76bead33d38beca913424320196923f5ec279059060649b83ae1d851eacdf9bfedd3e93ccd1d89dc988872f3327d1')
b2sums_i686=('ed8d7784e1c1d52e0d8df0102f6314b0ce15c38e532a4ea051eac65e5630eb9217dd0c2939f94c6c39de570ab9ceef567611c39dd8f2dbd74a2973ad935acce2')
