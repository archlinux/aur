# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=145.1
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver")
depends=("glibc")
install=torrserver.install
source=("https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service" "systemd.patch")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/YouROK/TorrServer/releases/download/MatriX.$pkgver/TorrServer-linux-amd64")
source_armv7h=("$pkgname-$pkgver-armv7h::https://github.com/YouROK/TorrServer/releases/download/MatriX.$pkgver/TorrServer-linux-arm7")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/YouROK/TorrServer/releases/download/MatriX.$pkgver/TorrServer-linux-arm64")
source_i686=("$pkgname-$pkgver-i686::https://github.com/YouROK/TorrServer/releases/download/MatriX.$pkgver/TorrServer-linux-386")
b2sums=('7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad'
        '20d847419c499b2286abe6d12113443446feff6aa6c2dac5e60d4c1bbfb0845d682761bde2880eacb2f9b29c12f3213ef6f9f3ae7e141586bd8483da00b9f440')
b2sums_x86_64=('f1673b10db49b13970d96c6fdd69138ca020f38520c198e6e83d03661a7e8423f30ae0451123e1b4ce7945c082d263a6957fd553e82b692954f24ba91b6e862e')
b2sums_armv7h=('7d51bfcd2a2259ed875b39dd5739b275fb98e5300ce7b23974425529f1730ddf13cafa73e526d380b916ba1a6f0bf8695249321a8fbad23658cfc33b4e7c072e')
b2sums_aarch64=('bc82513eab074e1107df72303b066374d93b3f8b2c9e1a9d58ef443b152af0b38bbd8d34f78bb32e4d7305cfc02e2d5082e17ef35c07f631a0ac0fc87cff2674')
b2sums_i686=('8657cf027a40def775100bd7522d01d02b34bc06b5226ca910d6df638b1b1ee0d5da5b34f314d0d0f957faf40e2f55408c09e09489aa55f6d4834f6d75d37904')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
