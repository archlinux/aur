# Maintainer: n0yd <deehark87@gmail.com>
pkgname=re-amped2
pkgver=0.5.0
pkgrel=1
pkgdesc='Installer for RE-Amped2, a native PC port of Amped 2'
arch=('x86_64')
url='https://github.com/Nico-D-eu/RE-Amped2'
license=('MIT' 'LGPL-2.1-or-later')
depends=('bash' 'cmake' 'coreutils' 'gawk' 'gcc' 'glibc' 'libepoxy'
         'libglvnd' 'ninja' 'openssl' 'pkgconf' 'python' 'sdl2')
optdepends=(
  'java-runtime-headless: builds the RE-Amped2 menu mod'
  'ffmpeg: optional HD movie conversion and playback'
)
options=('!debug')
_archive="RE-Amped2-${pkgver}-linux"
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.gz")
sha256sums=('545981be57dc0322c8f9c2067eb800d7b8c5e0ab01200e08092c7631bda55bd1')

package() {
  cd "$srcdir/$_archive"
  local payload="$pkgdir/usr/lib/$pkgname"
  local licenses="$pkgdir/usr/share/licenses/$pkgname"

  install -d "$payload" "$licenses" "$pkgdir/usr/bin"
  cp -a --no-preserve=ownership amped2 xboxrecomp tools "$payload/"
  install -m755 install.sh "$payload/install.sh"
  install -m644 INSTALL.txt manifest.txt RE-Amped2.png "$payload/"
  install -m644 amped2/LICENSE "$licenses/RE-Amped2-LICENSE"
  install -m644 xboxrecomp/LICENSE "$licenses/xboxrecomp-LICENSE"
  install -m644 amped2/licenses/*-LICENSE.txt xboxrecomp/LICENSES/LGPL-2.1.txt "$licenses/"

  ln -s "../lib/$pkgname/install.sh" "$pkgdir/usr/bin/re-amped2-setup"
}
