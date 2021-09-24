# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app
pkgver="2.0.16"
pkgrel=14
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/notion-enhancer/notion-repackaged"
license=('MIT')

depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)
makedepends=()
provides=('notion-app')
conflicts=('notion-app')

notion_repackaged_ver="2.0.16-5"

source_x86_64=("${url}/releases/download/v${notion_repackaged_ver}/notion-app-${notion_repackaged_ver}.pacman")
source_aarch64=("${url}/releases/download/v${notion_repackaged_ver}/notion-app-${notion_repackaged_ver}-aarch64.pacman")
sha256sums_x86_64=('22cfd38a1009997fb66342212eef54f8de8067388a62af4e04cb1120ef24d98a')
sha256sums_aarch64=('c48341ef74a193ef30678e82f95fef95e50627ba1c9cdd2266b6be8091bd230c')

install=${pkgname}.install

package() {
  product_name="Notion"
  package_name="notion-app"  

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${product_name}"

  cp -r "${srcdir}/opt/${product_name}" "${pkgdir}/opt/"

  icons_dir_path="usr/share/icons/hicolor"
  desktop_file_path="usr/share/applications/${package_name}.desktop"

  for icon_size_name in $(ls ${srcdir}/${icons_dir_path}); do
    icon_size_path="${icons_dir_path}/${icon_size_name}/apps"
    install -d "${pkgdir}/${icon_size_path}"
    install -m644 "${srcdir}/${icon_size_path}/${package_name}.png" \
                  "${pkgdir}/${icon_size_path}/${package_name}.png"
  done

  install -Dm644 "${srcdir}/${desktop_file_path}" "${pkgdir}/${desktop_file_path}"
}
