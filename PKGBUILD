# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Upstream: https://github.com/juglesbass/AgildoCheats — etiqueta v${pkgver}

pkgname=agildocheats

_githubuser=juglesbass
_repo=AgildoCheats

pkgver=1.0.10
pkgrel=1

pkgdesc="Trainer de memória Linux: scanner, .CT, congelar valores e teleport (PyQt6)"
arch=("any")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "python"
  "python-psutil"
  "python-pyqt6"
)
makedepends=()

optdepends=(
  "nvidia-utils: leitura de GPU NVIDIA via nvidia-smi"
)

install="${pkgname}.install"

_source_file="${_repo}-${pkgver}.tar.gz"
source=(
  "${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz"
  "agildocheats.desktop"
)
sha256sums=('05faa214d5b1f0d3df5c85139bc8010a2593066afc53c7bc050d9b48b4419d4b'
            '778f0be0ac03ed41991bde29030b88d69f455d252ce1c1c37ad4c1fe478bddda')

package() {
  cd "${srcdir}/${_repo}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -m644 agildo_cheats.py "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec python -u /usr/lib/agildocheats/agildo_cheats.py "$@"
EOF

  install -Dm644 "${srcdir}/agildocheats.desktop" \
    "${pkgdir}/usr/share/applications/agildocheats.desktop"

  local icone="${pkgdir}/usr/share/icons/hicolor"
  for tam in 16 22 24 32 48 64 128 256; do
  if [[ -f "data/icons/hicolor/${tam}x${tam}/apps/agildocheats.png" ]]; then
    install -Dm644 "data/icons/hicolor/${tam}x${tam}/apps/agildocheats.png" \
      "${icone}/${tam}x${tam}/apps/agildocheats.png"
  fi
  done
  if [[ -f data/icons/hicolor/scalable/apps/agildocheats.svg ]]; then
    install -Dm644 data/icons/hicolor/scalable/apps/agildocheats.svg \
      "${icone}/scalable/apps/agildocheats.svg"
  fi
  if [[ -f data/icons/hicolor/scalable/apps/agildocheats.png ]]; then
    install -Dm644 data/icons/hicolor/scalable/apps/agildocheats.png \
      "${icone}/scalable/apps/agildocheats.png"
  fi
  if [[ -f icone.png ]]; then
    install -Dm644 icone.png "${pkgdir}/usr/share/pixmaps/agildocheats.png"
  fi
}
