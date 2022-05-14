# Author: Liran Piade <liranpiade@gmail.com>

pkgname=twoinone
pkgver=1.5
pkgrel=1
pkgdesc="Software built to allow convertible 2 in 1s to switch between operation modes manually"
arch=('any')
url="https://github.com/lirannl/${pkgname}"
license=('GPL3')
depends=('sudo' 'bash')
makedepends=('git' 'rust')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  cargo build -r
}

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}/usr/share/twoinone/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/sudoers.d/"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  chmod 750 "${pkgdir}/etc/sudoers.d/"
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  cp twoinone "${pkgdir}/usr/bin/twoinone"
  chmod 755 "${pkgdir}/usr/bin/twoinone"
  cp target/release/twoinone "${pkgdir}/usr/share/twoinone/twoinone"
  chmod 755 "${pkgdir}/usr/share/twoinone/twoinone"
  cp twoinone.sudoers "${pkgdir}/etc/sudoers.d/${pkgname}"
  chmod 600 "${pkgdir}/etc/sudoers.d/${pkgname}"
  cp twoinone.group "${pkgdir}/usr/lib/sysusers.d/twoinone.conf"
  chmod 644 "${pkgdir}/usr/lib/sysusers.d/twoinone.conf"
  cp twoinone.json "${pkgdir}/usr/share/twoinone/twoinone.json"
  chmod 644 "${pkgdir}/usr/share/twoinone/twoinone.json"
  cp two-in-one.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/two-in-one.svg"
  chmod 644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/two-in-one.svg"
  cp twoinone.desktop "${pkgdir}/usr/share/applications/twoinone.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/twoinone.desktop"
}
