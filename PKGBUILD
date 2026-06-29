# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=141.9
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
b2sums_x86_64=('a99dce1e05ef678d49da238c652509e0900fb9d9befcab46366f0698722908d71aeb4928cdc1892ee3b7f877a56eb5dbb9a167ddb8345cb458fd8f054553c7b2')
b2sums_armv7h=('e7aaba647bb65db9d1c5440107563ac7a25a21038b65e52653d09c6ed1b3d27be9590949d3b21f9585c2b238234cdd26f9a9dcf682c16e07e3acc52ecf7ddd84')
b2sums_aarch64=('37a5f44c17bb2d0aa71021c4567eebc37d0139a77ffbde71d6bc9eaf89c4fb0412f7dfc7fbfd793279f36d8a1d7f1b05e184b88ef52a13ba801331b982ed6c9f')
b2sums_i686=('73044bdc2fdb73e11d7c6deb6c85787fc59ef4d8420ca040d6d792d71ccee53e7fed50e82ed438010be5095d0cfcf795ef45d294b9812483973f525e1283f82e')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
