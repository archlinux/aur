# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=notion-app-zh_cn
pkgver="2.0.18"
pkgrel=1
pkgdesc="The all-in-one workspace for your notes and tasks(Chinese Translation)"
arch=('x86_64')
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
makedepends=('asar')
provides=('notion-app')
conflicts=('notion-app')

notion_repackaged_ver="2.0.18-1"

source_x86_64=(
  "${url}/releases/download/v${notion_repackaged_ver}/notion-app_${notion_repackaged_ver}_amd64.deb"
  "https://github.com/Reamd7/notion-zh_CN/releases/download/2.4.10/notion-zh_CN.js"
  )

sha256sums_x86_64=(
  '7246fb0485cc6ecd5f5381d0568b29d77afff3628ee42a486f39d5af8728ff4e' 
  'c2e9663f7d932230c6c18dbdc55a8fd5abe090bb7f4f41742203be5913a21a85'
  )

package() {
  product_name="Notion"
  package_name="notion-app"
  tar xpf data.tar.xz -C ${pkgdir}
  cp notion-zh_CN.js ${pkgdir}/opt/${product_name}/resources
  cd ${pkgdir}/opt/${product_name}/resources
  asar extract app.asar ./temp
  mv notion-zh_CN.js temp/renderer
  echo -e '\nrequire("./notion-zh_CN")'>>temp/renderer/preload.js
  rm ./app.asar
  asar pack temp app.asar
  rm -r temp
}
