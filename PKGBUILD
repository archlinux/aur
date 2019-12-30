# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=xqwizard
pkgver=5.52
pkgrel=1
pkgdesc="A super powerful Chinese chess teaching, computer game and chess score editing software"
arch=('i686' 'x86_64')
url="https://www.xqbase.com"
license=('custom:xqwizard')
makedepends=('icoutils')
depends=('bash' 'wine' 'hicolor-icon-theme')
source=(
  "https://www.xqbase.com/download/xqwizard_portable.7z"
  "https://download.microsoft.com/download/5/a/d/5ad868a0-8ecd-4bb0-a882-fe53eb7ef348/VB6.0-KB290887-X86.exe"
  "file://xqwizard.desktop"
  "file://xqarena.desktop"
  "file://xqschool.desktop"
  "file://xqwizard"
  "file://xqarena"
  "file://xqschool"
)
noextract=(
  "xqwizard_portable.7z"
)

prepare() {
  cd "${srcdir}"
  mkdir -p "pkg"
  cd "pkg"
  bsdtar xf ../xqwizard_portable.7z
  bsdtar xf ../vbrun60sp6.exe msvbvm60.dll
}

build() {
  cd "${srcdir}"
  mkdir -p icons
  wrestool -v -x -t 14 -o "icons" "pkg/XQWIZARD.EXE"
  wrestool -v -x -t 14 -o "icons" "pkg/XQARENA.EXE"
  wrestool -v -x -t 14 -o "icons" "pkg/XQSCHOOL.EXE"
  icotool -x -o "icons" "icons/XQWIZARD.EXE_14_1.ico"
  icotool -x -o "icons" "icons/XQARENA.EXE_14_1.ico"
  icotool -x -o "icons" "icons/XQSCHOOL.EXE_14_1.ico"
}

package() {
  cd "${srcdir}"
  for n in XQWIZARD XQARENA XQSCHOOL; do
    for s in 16 32 48; do
      install -Dm644 icons/$n*${s}x${s}*.png "${pkgdir}/usr/share/icons/hicolor/"${s}x${s}/apps/$n.png
    done
  done
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 *.desktop "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 xqarena xqschool xqwizard "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/xqwizard"
  touch "${pkgdir}/usr/share/licenses/xqwizard/LICENSE"
  cp -rf 'pkg' "${pkgdir}/usr/share/xqwizard"
}

# vim:set ts=2 sw=2 et:
sha256sums=('45f1d1b99056dc382c241d4e01bacc9ec085891ca6c3983a159352aa476f57d5'
            '467b5a10c369865f2021d379fc0933cb382146b702bbca4bcb703fc86f4322bb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
