# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Siavash Askari Nasr <ciavash@proton.me>
# Contributor: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt-bin
pkgver=9.7.1
pkgrel=1
pkgdesc='PeaZip file manager and archiver (Qt5, binary release)'
url='https://github.com/peazip/PeaZip'
license=('LGPL3')
arch=('x86_64')
depends=('brotli' 'hicolor-icon-theme' 'libx11' 'p7zip' 'qt5pas' 'zstd')
options=('!emptydirs')
optdepends=('arc: Arc file archiver and compressor'
            'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
            'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
            'upx: Extendable, high-performance executable packer for several executable formats'
            'zpaq: Programmable file compressor, library and utilities'
            '7-zip: File archiver with a high compression ratio')
provides=('peazip')
conflicts=('peazip')
source=("$url/releases/download/$pkgver/peazip-$pkgver.LINUX.Qt5-1.x86_64.rpm")
sha256sums=('5a08070febfcc5c48ac5ee00d3db1f5e60b67b1033ddaaf57a93c8924b1fad53')

prepare() {
  cd usr/share/peazip
  rm -r lang-wincontext
  rm -r batch/{Windows,'macOS service menus',bat}
  rm -r batch/freedesktop_integration/KDE-servicemenus/{KDE3*,KDE4*}
  rm icons/peazip_seven.icl
  rm readme/readme_{Windows,macOS}.txt
  cd "$srcdir/usr/lib/peazip/res/bin"
  ln -sf /usr/bin/7z 7z/7z
  ln -sf /usr/bin/brotli brotli/brotli
  ln -sf /usr/bin/zstd zstd/zstd
  rm 7z/7z.sfx
  chmod -x 7z/Codecs/*.so
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,lib/peazip,share/{doc/peazip,peazip,licenses/peazip,icons/hicolor/256x256/apps}}
  cd usr
  mv bin/peazip "$pkgdir/usr/bin"
  mv lib/peazip/{peazip,pea,res} "$pkgdir/usr/lib/peazip"
  cd share
  mv applications "$pkgdir/usr/share"
  mv pixmaps/* "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cd peazip
  mv peazip_help.pdf "$pkgdir/usr/share/doc"
  mv copying/* "$pkgdir/usr/share/licenses/peazip"
  mv readme/readme_Linux.txt "$pkgdir/usr/share/doc/peazip/readme.txt"
  rm -r readme
  mv ../peazip "$pkgdir/usr/share"
  ln -s /usr/lib/peazip/pea "$pkgdir/usr/bin"
}
