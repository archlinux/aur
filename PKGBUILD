pkgname=hyprspaces
pkgver=1.1.3
pkgrel=1
pkgdesc="Paired workspace plugin and setup scripts for Hyprland"
arch=('x86_64')
url='https://github.com/jtaw5649/hyprspaces'
license=('MIT')
depends=('bash' 'hyprland' 'python')
makedepends=('cmake' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e196d8cabdbb93385e3c7dbcbc522968c55db0e834d6b5dd01d04107dd309faf')

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/${pkgname}-${pkgver}/build" -DCMAKE_BUILD_TYPE=Release
  cmake --build "${srcdir}/${pkgname}-${pkgver}/build"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "build/hyprspaces.so" "${pkgdir}/usr/lib/hyprspaces/hyprspaces.so"

  install -Dm755 "scripts/hyprspaces-install" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-install"
  install -Dm755 "scripts/hyprspaces-uninstall" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-uninstall"
  install -Dm755 "scripts/hyprspaces-waybar-restart" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-restart"
  install -Dm755 "scripts/hyprspaces-waybar-use-fork" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-fork"
  install -Dm755 "scripts/hyprspaces-waybar-use-stock" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-stock"

  install -Dm644 "config/hyprspaces-plugin.conf" "${pkgdir}/usr/share/hyprspaces/config/hyprspaces-plugin.conf"
  install -Dm644 "config/hyprspaces-bindings.conf" "${pkgdir}/usr/share/hyprspaces/config/hyprspaces-bindings.conf"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-install" "${pkgdir}/usr/bin/hyprspaces-install"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-uninstall" "${pkgdir}/usr/bin/hyprspaces-uninstall"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-restart" "${pkgdir}/usr/bin/hyprspaces-waybar-restart"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-fork" "${pkgdir}/usr/bin/hyprspaces-waybar-use-fork"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-stock" "${pkgdir}/usr/bin/hyprspaces-waybar-use-stock"
}
