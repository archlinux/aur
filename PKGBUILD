# Based on snapgene-viewer package by Antony Lee <anntzer dot lee at gmail dot com>
# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Contributor: Lorenzo Gaifas <brisvag at gmail dot com>
pkgname=snapgene
pkgver=8.2.1
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='https://www.snapgene.com/about'
license=('custom')
depends=('qt6-base'
         'qt6-webchannel'
         'qt6-5compat'
         'qt6-declarative'
         'qt6-positioning'
         'qt6-svg'
         'qt6-webengine'
         'qca-qt6'
         'libsm'
         'fontconfig'
         'nspr'
         'xz'
         'expat'
         'glibc'
         'gcc-libs'
         'libc++'
         'libc++abi'
         'dbus'
         'krb5'
         'libxcb'
         'libxkbcommon-x11'
         'xcb-util-image'
         'xcb-util-wm'
         'libx11'
         'libxkbfile'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'nss'
         'hicolor-icon-theme'
         'libice'
         'libglvnd'
         'libxext'
         'openssl-1.1'
         'zlib'
         'openmp'
)
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGene/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/"$pkgname"_"$pkgver"_linux.deb"
  "snapgene")
sha256sums=('c202819aaefb75ffddd28a755fe19685e92479f76fcf5722e75099a2cf4e5cc7'
  '754fdfb4131f8cb8f53560ea19362c3cc90ee14ea7cd68c353a9d3b8d132b993')

prepare() {
  tar -xf data.tar.xz
}

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir "$pkgdir/usr/bin"
    cp "$srcdir/snapgene" "$pkgdir/usr/bin/"

    sed -i 's`${INSTALLED_DIR}/snapgene "$@"`QT_QPA_PLATFORM="xcb" ${INSTALLED_DIR}/snapgene "$@"`' "$pkgdir/opt/gslbiotech/snapgene/snapgene.sh"
    
    chmod a+x "$pkgdir/usr/bin/snapgene"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
