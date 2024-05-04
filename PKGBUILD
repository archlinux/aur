# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

pkgname=archipelagomw-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="A Multi-Game Randomizer and Server"
arch=("x86_64")
url="https://github.com/ArchipelagoMW/Archipelago"
license=("MIT")
depends=("python-colorama" "python-websockets" "python-yaml" "python-jellyfish" "python-jinja" "python-schema" "python-kivy" "python-bsdiff4" "python-platformdirs" "python-certifi" "cython" "python-cymem" "python-orjson" "python-typing_extensions")
source=("https://github.com/ArchipelagoMW/Archipelago/releases/download/$pkgver/Archipelago_${pkgver}_linux-x86_64.tar.gz")
sha512sums=('2cbdde4e7912f77641b9c41c6b1de1bf097c5087d468ee28af0af72c5b3ae290668350770eada870564e906f5799426a73e661d8dbf98c3c59ff47df0257cce8')

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/Archipelago/" "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"

  while IFS= read -r -d '' i; do
    file="${i##*/}"
    cat <<EOF >"$pkgdir/usr/bin/$file"
#!/bin/bash
cd /opt/Archipelago
./$file
EOF
    chmod +x "$pkgdir/usr/bin/$file"
  done < <(find "$pkgdir/opt/Archipelago" -maxdepth 1 -type f -name "Archipelago*" -executable -print0)
}
