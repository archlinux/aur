# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Based on Teamcity PKGBUILD by Nowaker

pkgname=upsource
pkgver=2.0.3678
pkgrel=1
pkgdesc='Repository Browsing and Code Review tool from JetBrains'
arch=('any')
url="https://www.jetbrains.com/upsource/"
license=('Commercial')
depends=('java-runtime-headless')
install="$pkgname.install"
source=("https://download.jetbrains.com/upsource/upsource-${pkgver}.zip"
        'upsource.service'
	'upsource.conf')
sha256sums=('d6474bd7fea8a48c8d7a38826e16ac08a4d174f51c169bc114c4ba6636d81415'
            '90d447198d5ccb96985860a4d1e3b82fa6bfa2ce0def4e7214fbc2dcfe93add7'
	    '1d216f3e4494a665860a5ca2b295bb22640b6fe5a34e7149fcfd2dfb3026c55f')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  mkdir -p "${pkgdir}/usr/share/licenses"
  mkdir -p "${pkgdir}/var/lib/upsource"
  mkdir -p "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/upsource.service" "${pkgdir}/usr/lib/systemd/system/upsource.service"
  install -Dm755 "${srcdir}/upsource.conf" "${pkgdir}/etc/conf.d/upsource"
  # Java for Windows or MacOS is not needed
  rm -rf "${srcdir}/Upsource/internal/java/mac-x64/"
  rm -rf "${srcdir}/Upsource/internal/java/windows-amd64/"
  cp -R "${srcdir}/Upsource"/* "${pkgdir}/opt/${pkgname}"
}
