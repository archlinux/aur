# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=134
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
b2sums_x86_64=('3f197c2d5019f6cf929a64bde6681e55c6ea3fe429f9bff25ae716ad578797ce7d02f812f5dc666dcd8683674bc350af3bde8e3ed9c1edbd798791442ef095b8')
b2sums_armv7h=('9c0bedf8018fe04fe5d3991e90daf3109c924ec37854d9361a7d6186154e9a301f326ba8e129786ab9ade6ad315a797b31aa7ee362fedfa9e30fd16a863dab75')
b2sums_aarch64=('517b9c0bb427c0ac32d499dc91986ec1cd6a93f6203c0adcf0d894cbbfad89dc4b18681ff3e1fbec139706cca66b39d341070bc6ce29d4f862c1dd898353d250')
b2sums_i686=('2fcaa47d0a60a14d71b876c9a758a9f7aff02471aa8de60691be99e9c6fd5b9f188ab8cc8f1b1dca2eef58c336b7ada03a00e00ed5da0f7d28719f8d4c0409a8')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
