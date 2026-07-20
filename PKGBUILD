# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=142.2
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
b2sums_x86_64=('d104329f74e6581fce6934a80e2d664ebab4d75753e1c71351b81939a73dd7316722d342fd9fac287d6c4e9823e138669cb7f1a7a80e57d15b1805f891660b02')
b2sums_armv7h=('45ba47ceb5a15bd4fed9a90e9274d1ff14f323f401f3eb20fee96df639bd03cb68f9ab0465ec131c28152e3aa49eee520cff4082c92fcdbe6992bda52a7267a0')
b2sums_aarch64=('17824255c3593da6cff11c9f06b324da9ace930f1d125e6af675e10522b0196197a4efeebca97cf5873c287b78dc9bb0d8dcea0be5472ef1782bb41a0819be23')
b2sums_i686=('165619a7e0d7ac48adbf8d4b52136c6093822b0ff79518e8b56905c5df289b41b92a3aa4a337c10d749a680fc5d48677af5439678f03a859a82a3fa7f17f13a4')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
