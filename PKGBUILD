# Maintainer: Yupian Shuang <shuangyupian at qq dot com>

pkgname=multimc-bin
_pkgname=multimc
pkgver=0.7.0.3809
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
source=("$_pkgname-$pkgver.tar.gz::https://files.multimc.org/downloads/mmc-develop-lin64.tar.gz"
        "multimc.svg"
        "multimc.desktop"
        "wrapper.sh")
sha256sums=('e6ebe8957d97c481968065ec48d2e7181ed305991c9e8c9dd2a9bcdc4bc6bc82'
            '8c2c1ff1f4ce4ca7a7453ec1f7f666087f4319db7c654f81a7827a34f0c17e33'
            '6d12903a5630c9ff7aa35769566f29a8b4b591024cc61be826f4a3b1e8bea3bc'
            '53c3044ae1e7c28a5458f51c00395a14c1a9dc43a0235c882e524da499e0aef8')

package() {
  cd "$srcdir/MultiMC/bin"

  find -type f -exec \
    install -Dm 644 '{}' "$pkgdir/usr/lib/multimc/{}" \;
  find "$pkgdir" -type f '(' -name '*.so' -o -name 'MultiMC' ')' -exec \
    chmod +x '{}' \;

  install -Dm 644 "$srcdir/multimc.svg" "$pkgdir/usr/share/pixmaps/multimc.svg"
  install -Dm 644 "$srcdir/multimc.desktop" "$pkgdir/usr/share/applications/multimc.desktop"
  install -Dm 755 "$srcdir/wrapper.sh" "$pkgdir/usr/bin/multimc"
}
