# Maintainer: Yupian Shuang <shuangyupian at qq dot com>

pkgname=multimc-native
_pkgname=multimc
pkgver=0.6.13.2519
_pkgver=$(sed 's/.[0-9]\+$//' <<< "$pkgver")
pkgrel=1
pkgdesc="MultiMC without the non-native download script."
arch=('x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'java-runtime')
provides=('multimc')
conflicts=('multimc')
optdepends=('mcedit: Allows editing of minecraft worlds'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries'
)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/MultiMC/Launcher/releases/download/$_pkgver/mmc-stable-lin64.tar.gz"
        "multimc.svg"
        "multimc.desktop"
        "multimc")
sha256sums=('96a660ca8b81c4214489bfb390911bce554c65c980e7b5ee0d5d8e11becd15bd'
            '8c2c1ff1f4ce4ca7a7453ec1f7f666087f4319db7c654f81a7827a34f0c17e33'
            '6d12903a5630c9ff7aa35769566f29a8b4b591024cc61be826f4a3b1e8bea3bc'
            '3daa7b436cd7230d06a8808a9c9b5e6b4612572350d928149125a88a1ca5a515')

pkgver() {
  cd ${srcdir}/MultiMC/bin
  echo $(./MultiMC -V) | head -n1 | sed 's/^.*Version \([0-9.-]*\).*$/\1/' | sed 's/-/\./g'
}

package() {
  cd "${srcdir}"
  install -Dm 644 "${srcdir}/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -Dm 644 "${srcdir}/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -Dm 644 "${srcdir}/MultiMC/bin/jars/JavaCheck.jar" "${pkgdir}/usr/lib/multimc/jars/JavaCheck.jar"
  install -Dm 644 "${srcdir}/MultiMC/bin/jars/NewLaunch.jar" "${pkgdir}/usr/lib/multimc/jars/NewLaunch.jar"
  install -Dm 755 "${srcdir}/MultiMC/bin/libMultiMC_iconfix.so" "${pkgdir}/usr/lib/multimc/libMultiMC_iconfix.so"
  install -Dm 755 "${srcdir}/MultiMC/bin/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/multimc/libMultiMC_nbt++.so"
  install -Dm 755 "${srcdir}/MultiMC/bin/libMultiMC_quazip.so" "${pkgdir}/usr/lib/multimc/libMultiMC_quazip.so"
  install -Dm 755 "${srcdir}/MultiMC/bin/libMultiMC_rainbow.so" "${pkgdir}/usr/lib/multimc/libMultiMC_rainbow.so"
  install -Dm 755 "${srcdir}/MultiMC/bin/MultiMC" "${pkgdir}/usr/lib/multimc/MultiMC"
  install -Dm 755 "${srcdir}/multimc" "${pkgdir}/usr/bin/multimc"
}
