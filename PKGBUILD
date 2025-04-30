# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=135
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
b2sums_x86_64=('08db582276f0fbdd995443da7beefd9df677026e7e926fcf4142f93b9e25b4ee7cd318406ee5cf2dc5e81d7228b3b7185f6eaf36e145f323a5146aea9d980356')
b2sums_armv7h=('0d5f2160d41768122482845ea62e2e555b4f044fe5a457c4a81dfe82e3bb5fa3dffaebba780b89fc7426ad77085988d9a74c2a79dcf5c4da6092f40668073be7')
b2sums_aarch64=('3b06bb3777061369fbfc91fe397e021fcf3698b277882d8b348365152093bcfaee8e0a1f328fa9b024ee2737dd18d2312abf6b1bfd85aa74c2aed0c3472b14c7')
b2sums_i686=('c1f65591cc8830bb4fb61298f76bab3f055f700cbf6f9667dd823d37c17f3f4ea8143cfa64bc0a50ec4eeb2220b09c04a1637781e22cebfb4665445a37185ba8')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
