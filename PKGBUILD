# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.111
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
b2sums_x86_64=('cbc396de62cb9c022defdba6948954a9004cef480a8f9633a46d37e89e73ee22511918990f184804653fa7d25b8109de41ca733005b1ac3e05bc4096a2bdff7c')
b2sums_arm=('3722c4e4d6bb9b43b32326ea4bedb332ef13a8ea6a746df52f767ff1e51dcdc480e6ca4bfc0416966721f068e597bdd5b1ae64e51e13c60485447ab8c5299174')
b2sums_armv7h=('bfdc1e8794c9e0136680c3a9e00944fd3fa48404f7b5b77b502cb20e8e9c456779c92368b719fda4e50f805bbaaa716720cf27413b5c56add32487fd921893ac')
b2sums_aarch64=('fb30b2de454054715364c106637d71cb2944c1df8c843d323b5cd6716befbf27aa0951dce3bc1370119916180453e1b606824454b2037845c451bfe73c74b008')
b2sums_i686=('96ecf7a66363379e7c2fc5c0259064c495a366c8204b49da660a733e50bd5a2ed63963cad007a3e1fb829a349f2363066b4e10766d8e85fec7123091dbc27ff4')
