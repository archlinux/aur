# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=121
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
b2sums_x86_64=('38a8d2169be8b21a597fbe40caf9ec4969b7c497eab2cf1bb8d62d5542cba1e0a01eb24c6c128e5d9add1d7ed4418bc51755a29fc8748857f87f598184590298')
b2sums_armv7h=('70be5f972c2d363edacbcfa992765734ee9b34f12d27749426e7dd16af148fb828289e6b381c0371ec9ffbadc37a8480dac732f0ae49d763763bbf1ff7f0dd53')
b2sums_aarch64=('d5fbee869ec350985a902694c7be9acca010dc3820906bb3c87a1c0b897f54025dd0ff663977b59359d4de9d25850a20eedac9776e21397db82a6e8c04989fb1')
b2sums_i686=('49e87fa3f41fbab5f0f698e85c96c60f42a153be6b53bdbc81d70e07269627d9b88d62db89234ddd49d17d0199e461ca9290ab69d843d16935cad6ebad43ccfe')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
