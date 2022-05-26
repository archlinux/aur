# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.115
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
b2sums_x86_64=('01db9ea6f18d104c3a6ec061b2b32077a12569db1050c001f5241b7cec72ba545703557a3cc427902d4aa3636eb634939dda3e8554305359498fca6d03a469bb')
b2sums_arm=('0792c7c0cf7038ce5bfb2dff2256739056b031c919d532bf6f41232a0beea9d9a73f63b0910a66016626a9856ef2d1c7c03a35c41a2e9aab25e0e844d3d2b0ce')
b2sums_armv7h=('dd2c400f1355a6470e357089fd00163516fafdc5fe9411d93f4d39a5b819a70e7b8aab74f4cc4c6e6670387a59c6ecbfd6b95f77b1cd83014e6ed3c1d5a0cb69')
b2sums_aarch64=('6d2237b6471132a42a9846531545a1e4deebfeabf91dc1a47865d4626369c9c93cfc1b07ee800ec6d3d0a370ac6de93677862a33711260233106be062149aa92')
b2sums_i686=('5939073d3d033373ac9c8871904f8d293cb1945fc8b97e8891cce402d25e4d823520a87c9522e8b1d3aa281bc83fe0b3b4cae9485e399956965d25eb724a3ceb')
