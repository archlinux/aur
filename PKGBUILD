# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=super-splatters-hib
pkgver=1.00
pkgrel=1
pkgdesc='Throw a band of semi-suicidal Splatters across the stage, ignite a series of explosions'
url="http://SpikeySnail.com"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('sdl2' 'openal' 'zlib' 'glew' 'nvidia-cg-toolkit')
depends_x86_64=('lib32-sdl2' 'lib32-openal' 'lib32-zlib' 'lib32-glew' 'lib32-nvidia-cg-toolkit')
source=("hib://SplattersSetup_linux_1402605762.sh"
        "$pkgname.sh")
sha256sums=('eb7eb6c3f27197265c66541e9073ff139fda9883f0d3f1f4961d72d6c73fd888'
            '199e369dedf7683b5534dc8140f62a80ea28bdd850a1f43e5d3023193ba434a1')
PKGEXT=".pkg.tar"

package() {
  install -d "$pkgdir"/opt/super-splatters/lib
  # data
  install -m644 data/noarch/* "$pkgdir"/opt/super-splatters
  # binary
  install -m755 data/x86/Splatters.bin.x86 "$pkgdir"/opt/super-splatters
  # libraries that are not in the repos
  install -m755 data/x86/lib/libGLEW.so.1.9 "$pkgdir"/opt/super-splatters/lib
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/super-splatters
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /opt/super-splatters/licenses.txt "$pkgdir"/usr/share/licenses/$pkgname
}
