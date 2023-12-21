# Maintainer: prismatica (contact@prismatica.dev)
pkgname="dlcunlockerscript"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="Interactive script for installing SmokeAPI or CreamLinux on Linux."
arch=(any)
url="https://github.com/prismatica-dev/DLCUnlockerScript"
license=("MIT")
makedepends=("git")
depends=("lib32-gcc-libs" "lib32-glibc" "glibc" "gcc-libs" "bash")
source=("${pkgname%-git}::git+https://github.com/prismatica-dev/DLCUnlockerScript.git")
sha512sums=("SKIP")
package() {
  echo "Installing DLCUnlocker"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${pkgname}/DLCUnlocker.sh" "${pkgdir}/usr/share/${pkgname}/DLCUnlocker.sh"
  install -Dm755 "${pkgname}/bash-menu.sh" "${pkgdir}/usr/share/${pkgname}/bash-menu.sh"
  install -Dm755 "${pkgname}/bash-draw.sh" "${pkgdir}/usr/share/${pkgname}/bash-draw.sh"

  echo "Installing DLCUnlocker (CreamLinux)"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/assets/CreamLinux"
  install -Dm644 "${pkgname}/assets/CreamLinux/cream_api.ini" "${pkgdir}/usr/share/${pkgname}/assets/CreamLinux/cream_api.ini"
  install -Dm644 "${pkgname}/assets/CreamLinux/cream.sh" "${pkgdir}/usr/share/${pkgname}/assets/CreamLinux/cream.sh"
  install -Dm644 "${pkgname}/assets/CreamLinux/lib32Creamlinux.so" "${pkgdir}/usr/share/${pkgname}/assets/CreamLinux/lib32Creamlinux.so"
  install -Dm644 "${pkgname}/assets/CreamLinux/lib64Creamlinux.so" "${pkgdir}/usr/share/${pkgname}/assets/CreamLinux/lib64Creamlinux.so"

  echo "Installing DLCUnlocker (SmokeAPI)"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI"
  install -Dm644 "${pkgname}/assets/SmokeAPI/SmokeAPI.config.json" "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI/SmokeAPI.config.json"
  install -Dm644 "${pkgname}/assets/SmokeAPI/steam_api.dll" "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI/steam_api.dll"
  install -Dm644 "${pkgname}/assets/SmokeAPI/steam_api64.dll" "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI/steam_api64.dll"
  install -Dm644 "${pkgname}/assets/SmokeAPI/version32.dll" "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI/version32.dll"
  install -Dm644 "${pkgname}/assets/SmokeAPI/version64.dll" "${pkgdir}/usr/share/${pkgname}/assets/SmokeAPI/version64.dll"

  echo "Creating /usr/bin Scripts"
  mkdir -p "${pkgdir}/usr/bin/"
  echo "sh /usr/share/${pkgname}/DLCUnlocker.sh \"\$@\"" >> "${pkgdir}/usr/bin/DLCUnlocker"
  echo "sh /usr/share/${pkgname}/DLCUnlocker.sh \"\$@\"" >> "${pkgdir}/usr/bin/dlcunlocker"
  chmod +x "${pkgdir}/usr/bin/DLCUnlocker"
  chmod +x "${pkgdir}/usr/bin/dlcunlocker"

  echo "Copying License"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  echo "DLCUnlocker Installed"
}
