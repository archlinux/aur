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
pkgver=9.6.0
pkgrel=1
pkgdesc='PeaZip file manager and archiver (Qt5, binary release)'
arch=('x86_64')
url='https://github.com/peazip/PeaZip'
license=('LGPL3')
depends=('qt5pas')
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
sha256sums=('b22c0ef4d3539cc96c39e880b26954f6c674f23e76dc021151a1e25c268ba40e')

prepare() {
  rm -r usr/share/peazip/batch/{Windows,'macOS service menus',bat}
  rm -r usr/share/peazip/batch/freedesktop_integration/KDE-servicemenus/{KDE3*,KDE4*}
  rm usr/share/peazip/icons/peazip_seven.icl
  rm -r usr/share/peazip/lang-wincontext
  rm usr/share/peazip/readme/readme_{Windows,macOS}.txt
  rm usr/lib/peazip/res/bin/7z/7z.sfx
  chmod -x usr/lib/peazip/res/bin/7z/Codecs/*.so
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,lib/peazip,share/{doc/peazip,peazip,licenses/peazip}}
  cd usr
  mv bin/peazip "$pkgdir/usr/bin"
  mv lib/peazip/{peazip,pea,res} "$pkgdir/usr/lib/peazip"
  cd share
  mv peazip/peazip_help.pdf "$pkgdir/usr/share/doc"
  mv peazip/copying/* "$pkgdir/usr/share/licenses/peazip"
  mv peazip/readme/readme_Linux.txt "$pkgdir/usr/share/doc/peazip/readme.txt"
  rm -r "peazip/readme"
  mv peazip "$pkgdir/usr/share"
  mv pixmaps applications "$pkgdir/usr/share"
}
