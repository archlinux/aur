# Maintainer: LJ <aur.lj at munally.com>
pkgname="adgobye-bin"
_name="AdGoBye"
pkgver="4.0.2"
_pkgveradd="v4IsBrokenPullMe"
pkgrel=1
pkgdesc="Content / Adblock for Social VR"
arch=('x86_64')
url="https://github.com/AdGoBye/AdGoBye"
license=('MIT')
depends=()
makedepends=('unzip' 'jq')
source=(
  "https://github.com/AdGoBye/AdGoBye/releases/download/v$pkgver%2B$_pkgveradd/AGBv$pkgver+$_pkgveradd-linux-x64.zip"
)
b2sums=('9df6e810bd0fceb2ff0879d6b354d4f1f8ffd26f5227ab66dfb17f212c215f970f6fb03ce4f4a81f8f9e0b1b1446c17db96706dc642a496a63695e7559eb3526')

package() {
  cd "${srcdir}"
  unzip -o "AGBv$pkgver+$_pkgveradd-linux-x64.zip"
  install -Dm755 "AdGoBye" "${pkgdir}/opt/${_name}/${_name}"
  cat appsettings.json | jq '.Settings.EnableUpdateCheck = false' > dist-appsettings.json
  install -Dm655 "dist-appsettings.json" "${pkgdir}/opt/${_name}/appsettings.json"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf "${pkgdir}/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
}
