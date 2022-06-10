# Maintainer: Yupian Shuang <shuangyupian at qq dot com>

pkgname=multimc-bin
_pkgname=multimc
pkgver=0.6.16.3430
pkgrel=1
pkgdesc="A custom launcher for Minecraft that allows you to easily manage multiple installations of Minecraft at once."
arch=('x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'java-runtime')
provides=('multimc')
replaces=('multimc-native')
conflicts=('multimc')
optdepends=('mcedit: Allows editing of minecraft worlds'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries')
source=("$_pkgname-$pkgver.tar.gz::https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz"
        "multimc.svg"
        "multimc.desktop"
        "multimc")
sha256sums=('63a43c5095b099ca780506365b0190fe795d20638e9e74f0363401bbef45ff11'
            '8c2c1ff1f4ce4ca7a7453ec1f7f666087f4319db7c654f81a7827a34f0c17e33'
            '6d12903a5630c9ff7aa35769566f29a8b4b591024cc61be826f4a3b1e8bea3bc'
            'e92fbc457b2cb00515450d7177a9f3f367694b60c6caaeb8b4069ca74b123b70')

package() {
  cd "$srcdir/MultiMC/bin"

  find -type f -exec \
    install -Dm 644 '{}' "$pkgdir/usr/lib/multimc/{}" \;
  find "$pkgdir" -type f '(' -name '*.so' -o -name 'MultiMC' ')' -exec \
    chmod +x '{}' \;

  install -Dm 644 "$srcdir/multimc.svg" "$pkgdir/usr/share/pixmaps/multimc.svg"
  install -Dm 644 "$srcdir/multimc.desktop" "$pkgdir/usr/share/applications/multimc.desktop"
  install -Dm 755 "$srcdir/multimc" "$pkgdir/usr/bin/multimc"
}
