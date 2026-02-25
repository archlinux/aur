# Maintainer: grimsteel <admin at vocabustudy dot org>
pkgname=pass-secret-service-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="An org.freedesktop.secrets provider with a pass backend"
url="https://github.com/grimsteel/pass-secret-service"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=("dbus")
optdepends=("pass")
conflicts=("pass-secret-service-git")
provides=("org.freedesktop.secrets" "pass-secret-service")
source=(
    "https://github.com/grimsteel/pass-secret-service/releases/download/v$pkgver/pass-secret-service-$arch"
    "https://github.com/grimsteel/pass-secret-service/raw/v$pkgver/systemd/org.freedesktop.secrets.service"
    "https://github.com/grimsteel/pass-secret-service/raw/v$pkgver/systemd/pass-secret-service.service"
)
sha256sums=('037f70815b0b6788b96e4673c7214f0e79a7be9bde476bfdb1c8f2b4e903d9c2'
            '42b1240c548876aad7e2df73b0b2447d2e034d58b8135677a1652fe7fbc42cfa'
            '66cb23e423b2809eb7b244ce1f026f4094ae297b493808f8e88bd0483518394a')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/pass-secret-service-$arch" "${pkgdir}/usr/bin/pass-secret-service"
  install -Dm 644 -t "${pkgdir}/usr/share/dbus-1/services/" "${srcdir}/org.freedesktop.secrets.service"
  install -Dm 644 -t "${pkgdir}/usr/lib/systemd/user/" "${srcdir}/pass-secret-service.service"
}
