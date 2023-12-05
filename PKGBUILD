# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: zhullyb < zhullyb [at] outook dot com >
# Contributor: sukanka < su975853527 [at] gmail dot com >
pkgname=adrive
url="https://www.aliyundrive.com/"
pkgrel=1
pkgver=4.9.16
pkgdesc="阿里云盘官方客户端app.asar提取版，直接调用系统electron运行"
arch=("x86_64")
license=("")
_electron=electron
depends=("$_electron")
makedepends=('p7zip')
source=(
  "https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive-4.9.16.exe"
  "aDrive.desktop"
  "aDrive.png"
)
sha256sums=('bb36e6204d6be7073ca9b13f273b55f788cd48dc9a849251a26b3239438b08d4'
            '3a7ce889fc9a31be70e36d37aba2cc23f00d4621cadcfa1c3eb40638ea8878d6'
            'fc2493439b0766992698acd3a7c74a1a90d2877699442b1d7c410d8606d74244')


prepare() {
7z x aDrive-4.9.16.exe -o"${srcdir}/aDrive"
cat >aDrive.sh <<EOF
#!/bin/sh
set -eu

export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_IS_DEV=0

exec $_electron --no-sandbox /usr/lib/aDrive/app.asar "\$@"

EOF
}

package() {
  install -Dm644 ${srcdir}/aDrive/resources/app.asar -t ${pkgdir}/usr/lib/aDrive/
  install -Dm644 ${srcdir}/aDrive.png -t ${pkgdir}/usr/lib/aDrive/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps/
  ln -s /usr/lib/aDrive/aDrive.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/aDrive.png

  install -Dm644 ${srcdir}/aDrive.desktop -t ${pkgdir}/usr/share/applications/
  install -Dm755 ${srcdir}/aDrive.sh ${pkgdir}/usr/bin/aDrive
}
