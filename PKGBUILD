# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.89
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver-git")
depends=("glibc")
install=torrserver.install

source=("systemd.patch")
sysemd_source="https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service"

source_x86_64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64" $sysemd_source)
source_i686=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386" $sysemd_source)
source_arm=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5" $sysemd_source)
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7" $sysemd_source)
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64" $sysemd_source)

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

b2sums=('20d847419c499b2286abe6d12113443446feff6aa6c2dac5e60d4c1bbfb0845d682761bde2880eacb2f9b29c12f3213ef6f9f3ae7e141586bd8483da00b9f440')
b2sums_x86_64=('36bb87c4b059b633403daaf6af6e8ea67af05c5c728e64fb81abc984ac15ee035a5f9aa3d62777f784f6987216bda603e9186ad00573bf1f23b7012a035ba931'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_arm=('238aba0299fc81e4d167391b208040218c1d21508e6edfa37a8e7ced0db467b81df295498d8ffaa2f2d0c960cfe14ce4e8c1fe127fa017976b6ae9845f7f3f3f'
            '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_armv7h=('65a161be428accf0f9ddec306f8413257115f10025e61ac05cdccec4c942e65200b0460ffa0ac35c9a913db97d71a8ee08b72d55a70360bb35f1ee10c209cabc'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_aarch64=('75d8390eb59cac92c10541f9acc1a23934b1265d1c1bcbac7c36d5f9cd5a7f84b7fc59c11b9c7e00a87bece2700aef54c1206f6aaa425dca28f043445e4df9ae'
                '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_i686=('47b66294d5abff745f8c621fce556fd4bbd996a2876b24bf118504ad3196cd7fdef41d27b2336bc4b6c47e4f8df2ad98da350accc7ed735417cd21f78165c0d1'
             '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
