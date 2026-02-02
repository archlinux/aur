# Maintainer: vho <v_h@me.com>

pkgname=lucidlink-bin
pkgver=3.3.7766
pkgrel=1
pkgdesc="Your private filespace in the cloud"
arch=('x86_64')
url="https://www.lucidlink.com/"
license=('custom')
depends=(
  'alsa-lib'
  'bash-completion'
  'fuse3'
  'gtk3'
  'libappindicator-gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
provides=('lucidlink')
conflicts=('lucidlink')
install="${pkgname}.install"
source=("https://releases.lucidlink.com/prod/linux-deb/lucidlink_${pkgver}_amd64.deb")
sha256sums=('1534ae00761dd75bb2cb9dc29c1b312cbaa88922883a1a54d65c7ad1bf5ab9a0')

package() {
  bsdtar -xf "${srcdir}/lucidlink_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  if [[ -e "${pkgdir}/usr/local/bin/lucidlink" ]]; then
    mv "${pkgdir}/usr/local/bin/lucidlink" "${pkgdir}/usr/bin/lucidlink"
  elif [[ -e "${pkgdir}/usr/local/bin/LucidLink" ]]; then
    mv "${pkgdir}/usr/local/bin/LucidLink" "${pkgdir}/usr/bin/lucidlink"
  fi

  if [[ -e "${pkgdir}/usr/local/bin/lucid" ]]; then
    mv "${pkgdir}/usr/local/bin/lucid" "${pkgdir}/usr/bin/lucid"
  fi

  if [[ -e "${pkgdir}/usr/local/bin/lucid3" ]]; then
    mv "${pkgdir}/usr/local/bin/lucid3" "${pkgdir}/usr/bin/lucid3"
  fi

  rmdir "${pkgdir}/usr/local/bin" 2>/dev/null || true
  rmdir "${pkgdir}/usr/local" 2>/dev/null || true
}
