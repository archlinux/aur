# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=152
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
b2sums_x86_64=('077f28d7b353388e77eb472c3fd74e028e4a015d4d1058f944d3457bc9ffa6b1afb199d3ed5abee455d81c473fe609fa25b57227bbe0899398e854665ddf2152')
b2sums_armv7h=('3cd15c51c0063621d2d6fd8c8d8012ae55d5b3cd3bc70d506043e6f2b82f8736e4ad59fd957a7324bdf38609c2044c1afb7cb86fb1ac9c880926ee5754b1677f')
b2sums_aarch64=('5eb4149d9c5bd17718e44aaef6bc5885dcbc291ea9c92aa44c3f51f9328f1d61cf98aab32effa89f6a7ea1e89ad6ecd11d75ddda0d9bdeacd1e4dd26122e7abe')
b2sums_i686=('b1f20acfdd2dcbf36e738da5cfa033492d6eaae00bb8457e6a1b3b3f8a072b0e55c17ce7f0ab3e93633fa82327945d6958f3c7145149101803630d0ff323fc3e')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
