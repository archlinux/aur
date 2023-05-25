# Maintainer: DaniD3v <nichtdu.login@gmail.com>

pkgname="akkufetch-git"
pkgdesc="Neofetch for laptop batteries"
url="https://github.com/mrHeavenli/akkufetch"

pkgver=20230525
pkgrel=7

license=("GPL3")
depends=("python-colorama" "upower" "dbus-python" "python")
makedepends=("git")

source=("akkufetch.sh" "git+https://github.com/mrHeavenli/akkufetch.git")
sha256sums=("1a72e93e0fb4aaea2c1f14a7ad4ca053a1397df3cefb69588859c9781bb8921d" "SKIP")
arch=("x86_64")

pkgver() {
  cd "${srcdir}/akkufetch"
  git log -1 --format=%cd --date=short | tr -d '-'
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  mkdir "${pkgdir}/usr/bin"
  mkdir "${pkgdir}/etc"

  cp -R "${srcdir}/akkufetch" "${pkgdir}/usr/share"

  cp "${srcdir}/akkufetch.sh" "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/bin/akkufetch.sh" "${pkgdir}/usr/bin/akkufetch"

  chmod +x "${pkgdir}/usr/bin/akkufetch"

  mv "${srcdir}/akkufetch/default_config.json" "${pkgdir}/etc/akkufetch.config"
}
