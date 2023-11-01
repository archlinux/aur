# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=127
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
b2sums_x86_64=('d4800ea11cb97bddcf283b818fa28a0b838c32f61afa733650d592d3f5121184ae232a3016bc7262c26a7d9d91048a1b2ef1658d6f6339787ae22cf6160f939c')
b2sums_armv7h=('2306489b288db93e398ed9144e4768eadc356ab20654425503306ee889957f9299eee695ac67ca39f0dd4cc10f3b5684cab7b9907dc64e50b662815f76ada5fe')
b2sums_aarch64=('eb0fde4d30e3b9316026d0d4bd7c2191f0ab5b9722386b8dcb333365deaba7c95ae5c789c63fc0efd0b81839b31072e02472d7460f0674df5217db6123af1039')
b2sums_i686=('cecc7e6c3cc75656fa5dcd6ad98f3063f1032694b3a857d2436b3bb7d78848c4558dfc342a36657d5eb4e1e9b191ee9a1a1b1d923dcfc5ef2509417c6da45f03')

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}"/$pkgname-$pkgver* "${pkgdir}/usr/bin/torrserver"
	install -d "${pkgdir}/var/lib/torrserver"
}
