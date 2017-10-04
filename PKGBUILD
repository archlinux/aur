# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=wavebox-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64' 'i686')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss' 'libappindicator-gtk2')
optdepends=('gvfs' 'libnotify')

source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums_x86_64=('20a12bd7dcca6d5eda3497c64f4bbcfe06a108b30840ecbe3aee39d62b1f553f2b103dee890864da03b709b9a70c19da2396e62da7251c69df2b7c804c0af819')
sha512sums_i686=('819eb438cecb2a04cbaae0ca265427670a18a5eb9c513482b73a2227a84ada6fd7ebe2afb1ff4e2815cf25eef7de7ae33fc45276ff7db47ce632f427f5e13fa3')

package() {
  if [ ${CARCH} == "x86_64" ]; then
    cd ${srcdir}/Wavebox-linux-x64
  else
    cd ${srcdir}/Wavebox-linux-ia32
  fi

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/wavebox"
  mkdir -p "${pkgdir}/usr/share/applications"

  cp --preserve=mode -R ./* "${pkgdir}/usr/share/wavebox"
  install -m644 ./wavebox.desktop "${pkgdir}/usr/share/applications/wavebox.desktop"
  ln -s "/usr/share/wavebox/Wavebox" "${pkgdir}/usr/bin/wavebox"

  chmod 644 "${pkgdir}/usr/share/wavebox/icon.png"
  chmod 644 "${pkgdir}/usr/share/wavebox/libnode.so"
}
