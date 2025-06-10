#!/bin/bash
# Maintainer: Curve <curve.platin at gmail.com>

pkgname=il2cpp-dumper-bin
pkgver=6.7.46
pkgrel=2
pkgdesc='A tool to reverse engineer il2cpp games'
arch=('x86_64')
url='https://github.com/Perfare/Il2CppDumper'
license=('MIT')
provides=('il2cpp-dumper')
conflicts=('il2cpp-dumper')
depends=('dotnet-host' 'dotnet-runtime-7.0' 'bash' 'python')
makedepends=()
source=(
  "$pkgname-$pkgver.zip::https://github.com/Perfare/Il2CppDumper/releases/download/v$pkgver/Il2CppDumper-net7-v$pkgver.zip"
  'il2cpp-dumper' # This is your local startup script
  'LICENSE::https://raw.githubusercontent.com/Perfare/Il2CppDumper/master/LICENSE'
)
sha256sums=('SKIP'
            'db3c1fb46b79cd5c786d0c4934735f1e93f3da9c13c8a16d7d9b78203f731e79'
            '373bd2ed813eaa8245d1290138985c6fb025d588db254602720697455ae36c6c')



package() {
  cd "$srcdir"

  # Install startup script
  install -Dm755 "il2cpp-dumper" "$pkgdir/usr/bin/il2cpp-dumper"

  # Install il2cpp files
  install -d "$pkgdir/usr/share/il2cpp-dumper"
  # This is a safer way to install multiple file types
  install -m644 ./*.{json,dll,py} "$pkgdir/usr/share/il2cpp-dumper/"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
