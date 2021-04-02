# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.85
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
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
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7" $sysemd_source)
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64" $sysemd_source)

case "$CARCH" in
  x86_64) _CARCH=amd64 ;;
  i686) _CARCH=386 ;;
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
b2sums_x86_64=('1dbbd2effcecc04831ab6cf018a263ad29e10d082cb6e3fdf0b06a50932f3387b85512e4ed5c7fa96b2b3f9c7606738355bd1ca3816d32db3248f18fabc9bdfc'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_armv7h=('543d359bc36f29c22df42509595b3b2e5f38db106bd3f6d3456133c5dbc2b2b6b280861d48587aafd9f061651fbc48b222c77b7bdd26e3ff6e55732a249edab2'
               '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_aarch64=('878938c35ec6286fd14c3929d4827634ae5ec3a69c417478f4d478d9b8a1010ccea54baf45cfde7995f2c38426e9af01dd1713403465d38d482c8bf869278ad9'
                '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
b2sums_i686=('e14ee42ab1464b3243a48c05fb3a581e1daa2ffc3c9e5614b3a803896ba81c8977bcb785140fe27c201fbf389c3e239ebf01cf0dc4dd0cf04bb121421a33f2af'
             '7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad')
